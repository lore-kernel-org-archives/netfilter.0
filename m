From: <kaskada@email.cz>
Subject: netem qdisc destroys traffic in other tc classes (HFSC classes)
Date: Thu, 26 Mar 2020 22:15:14 +0100 (CET)
Message-ID: <2V0.aV7d.74vp1bQJjZk.1UVHjY@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.0.52)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
        t=1585257317; bh=WswMvJiOidCd2hALtc1ry+052QDmUarUJJPbv89Mdog=;
        h=Received:From:To:Subject:Date:Message-Id:Mime-Version:X-Mailer:
         Content-Type:Content-Transfer-Encoding;
        b=cc9tKyeLaJbxesIku/oYC9nHysFXyw4GUgfWGo8RJRGXktaFvQmXw6X8bRp//IFbe
         27pEFixxkS9sx1B4sgBZYZt8woZc6sFnSJZVE1X3m6eK00108s4zo24kT0JAPOp0kA
         +3qF0VQdniVDLherMqoZ3x/g0G7YUQTaTmBuAsqA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I guess you will not beleive me that this is possible issue, but you can u=
se the simple script below to see.

I`m trying to use netem qdisc together with HFSC tc rules. For simplicity,=
 I wrote this tiny script, so you all can replicate the issue,
in case you are interested to. The problem is that if I send data traffic =
to class (1:aaaa) with netem attached, it harms the traffic going through =
the default class (1:ffff).
If I change netem for fq_codel (or sfq, pfifo, ...), than traffic going th=
rough "netem class 1:aaaa" does not have any impact to traffic going in de=
fault class.

This is very scary behaviour which costed me a lot of time when debugging =
much more comlicated setup (some 50000 tc rules).
It looks like HFSC and netem are not compatible and can not be used togeth=
er? I used netem with HTB recently and it was working well.

-->Netem will add delay to the traffic which is not going through "netem c=
lass".<--


If you try to run the script bellow and than start ping to some IP address=
 (for example 8.8.8.8, 8.8.4.4, ...) or generate any traffic which would g=
o through default class
and than try to download file from Mikrotik site, the downloading from Mik=
rotik would broke the other traffic. Delays to ICMP to 8.8.8.8 and 8.8.4.4=
 will than get very long... Downloading from Mikrotik will be bad too, but=
 that is what it should be (because it goes through netem class).

For example you can download this file (which is one of bigger ones on Mik=
rotik site I found):
https://download.mikrotik.com/routeros/7.0beta5/chr-7.0beta5.vhdx



script (un/comment netem/fq_codel lines for BAD/OK behaviour)...:
-------
# root qdisc a class:
tc qdisc add dev eth1 root handle 1: hfsc default ffff
tc class add dev eth1 parent 1: classid 1:1 hfsc ls m2 100000kbit ul m2 10=
0000kbit

# default qdisc a class - all traffic goes here, for simplicity:
tc class add dev eth1 parent 1:1 classid 1:ffff hfsc ls m2 50000kbit ul m2=
 50000kbit
tc qdisc add dev eth1 parent 1:ffff handle ffff:0 fq_codel

# except testing traffic going into class for testing netem qdisc
tc class add dev eth1 parent 1:1 classid 1:aaaa hfsc ls m2 10kbit ul m2 20=
000kbit
# netem qdisc - when used, it causes problems for all traffic in default c=
lass 1:ffff
tc qdisc add dev eth1 parent 1:aaaa handle aaaa:0 netem delay 500ms 15ms 2=
5%
# fq_codel (for example, same with sfq, pfifo) - OK, no problems
#tc qdisc add dev eth1 parent 1:aaaa handle aaaa:0 fq_codel

# for this simple script if you download files from Mikrotik site, it will=
 be put to "netem class 1:aaaa"
iptables -t mangle -A POSTROUTING -m physdev --physdev-in eth0 -s download=
.mikrotik.com -j CLASSIFY --set-class 1:aaaa


Thank you
Pep.
