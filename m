From: Salatiel Filho <salatiel.filho@gmail.com>
Subject: PRIO qdisc + iptables TOS target
Date: Thu, 22 Apr 2010 18:46:25 -0300
Message-ID: <t2lbeb91d721004221446w48913889t67532a9f2b9e8933@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:from:date:received
         :message-id:subject:to:content-type:content-transfer-encoding;
        bh=Gp2OnIE8naHqz+Rg2fiDw4E3fp4TMxTg9BGs7xvQxHo=;
        b=fKCkM/Nk/rk0RsYtfLaYsVU8Db2FnNCvaxXvwnRqqEK10FrxT4rtmiTeUU3Vn1nIIV
         qujgL97y47CTicVyp8/lW/ry4tfkZZ+RuPOYDfcsx33i0kbt1YmsQwS0qUQO/NL06jTf
         AkOcHYtfSlGlSnu3xNySSkdsilZQrcKEXcXFM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org, lartc@mailman.ds9a.nl

i am trying to do some traffic classification using the PRIO qdisc and
i am having a few problems.

I have a root htb class:

tc qdisc add dev imq0 root handle 1: htb  default 255 r2q 1
tc class add dev imq0 parent 1:  classid 1:1 htb rate 768kbit

and a child PRIO
tc class add dev imq0 parent 1:1 classid  1:99 htb rate 96kbit ceil
600kbit prio 0
tc qdisc add dev imq0 parent 1:99 prio
tc filter add dev imq0 parent 1: protocol ip  prio 7 u32 match ip dst
192.168.1.99 flowid 1:99




the result is:

# tc - s class ls dev imq0

class htb 1:1 root rate 768000bit ceil 768000bit burst 1599b cburst 159=
9b
 Sent 2451 bytes 22 pkt (dropped 0, overlimits 0 requeues 0)
 rate 1016bit 1pps backlog 0b 0p requeues 0
 lended: 0 borrowed: 0 giants: 0
 tokens: 250000 ctokens: 250000

class htb 1:129 parent 1:1 leaf 816c: prio 0 rate 96000bit ceil
600000bit burst 1599b cburst 1599b
 Sent 7269 bytes 50 pkt (dropped 0, overlimits 0 requeues 0)
 rate 1416bit 1pps backlog 0b 0p requeues 0

class prio 816c:1 parent 816c:
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
class prio 816c:2 parent 816c:
 Sent 7269 bytes 50 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0
class prio 816c:3 parent 816c:
 Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 backlog 0b 0p requeues 0



The problem is that when i want to give a higher priority for some
ports the packets keep going to 816:2 instead of 816:1

my iptables rules:


iptables -t mangle -I PREROUTING  -p tcp -m multiport --ports 22,80 -j
TOS  --set-tos 0x10

Shouldn't this rule make all packets from/to port 22 and 80 go through
816c:1 PRIO class ?


Any help is very welcome.


[]'s
Salatiel

"O maior prazer do inteligente =E9 bancar o  idiota
   diante de um  idiota que banca o inteligente".
