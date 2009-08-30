From: Gothmolly <gothmolly@gmail.com>
Subject: mangle vs. nat problem?
Date: Sun, 30 Aug 2009 19:51:13 -0400
Message-ID: <5427726c0908301651y59ef1babv7bbbe625f915ca01@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=kEMbKxFD/YnqPKlT5r53PtIGgPg2/acYRXteLNDPAc8=;
        b=lW1mKtV3C8cp1dXNE7ill+ysc0alNhzQPQetRp38prhwFe0JTqw4GA8oeWLFMsNuv8
         ZL7qN4ZkyLc7NW1m0AzlgcjhnlzYcvxc84qj4Q9/sfCmWHPOzrXzlPpxkXlvbQ9Rfcpj
         wdb3LvWhrQWfQ5R2UQjVOD5ZTYrD5C7EvCYSk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello all, I am having trouble with a combination of the nat and
mangle tables in the PREROUTING chain.   What I'd like to do is use
mangle  and connmark to mark every other packet coming in on a port,
then use nat to do a DNAT to 2 separate local ports, based on the
connmark entries.

I use the following:
iptables -t mangle -A PREROUTING -p udp --dport 514 -m statistic
--mode nth --every 2 --packet 0 -j CONNMARK --set-mark 1
iptables -t mangle -A PREROUTING -p udp --dport 514 -m statistic
--mode nth --every 2 --packet 1 -j CONNMARK --set-mark 2

then

iptables -t nat -A PREROUTING -m connmark --mark 1 -j DNAT
--to-destination 192.168.8.207:1514
ptables -t nat -A PREROUTING -m connmark --mark 2 -j DNAT
--to-destination 192.168.8.207:1515

(the machine is 192.168.8.207)

When I send traffic to the machine from a remote machine, I see that
the count of the rules in the mangle table update perfectly - every
other packet goes to every other rule.

On the nat table, I see far fewer packets matching, and most tend to
go to the first rule.

Is there some conflict between nat and mangle in PREROUTING?  Or am I
just doing this wrong ?

I am running the distribution included iptables on Ubuntu 9.04 x64
