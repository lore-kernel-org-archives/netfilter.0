From: Robert Pipca <robertpipca@gmail.com>
Subject: ebtables ACCEPT policy vs ACCEPT target
Date: Fri, 17 Dec 2010 00:16:47 -0200
Message-ID: <AANLkTi=w6jf1y8bH3=9AX7fLDORkbm2dAKS4uBv5KQPZ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=ihg8vd/iD1S/Uuw7x8r88ssgIeCYjAnYIYoIyni/kis=;
        b=GNdiYI+r+THSmRr6ymRNsUrq10XmqR5SWV0R52j3Outp6CCjcG2YAUBYZU6B5jutjE
         twirtNQM4Ph8dG5S9hhp6LeI6tzZesGoDHH5O0jgztw/hHIDkKQlem6ok/t+i9YAXGH6
         Log5t4FF60HaCtamxN3Mn3PxkC9u9j19pYWPY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm using 2.6.34.5 on a bridge environment.

I have eth1 and eth2 configured as a bridge (br0).

Trying to setup a web proxy, I did:

iptables -t nat -A PREROUTING -i br0 -p tcp --dport 80 -j REDIRECT
--to-port 1501

And "iptables -t nat -L -v " shows no packets seen by iptables.

Since "ebtables -t broute -L" shows me a empty BROUTING chain with
ACCEPT as the policy, everything is fine.

But if I do:

ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-proto tcp
--ip-dport 80  -j redirect --redirect-target ACCEPT
ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-proto tcp
--ip-sport 80  -j redirect --redirect-target ACCEPT

"iptables -t nat -L -v" now sees HTTP traffic.

My question is: Isn't this wrong? I'm basically applying the same
ACCEPT in both cases. Why do they produce different results?

I'm using ebtables v2.0.9-1.

Thanks for your help.

- Robert
