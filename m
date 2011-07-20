From: Ryan Whelan <rcwhelan@gmail.com>
Subject: Reject non-ipsec traffic
Date: Wed, 20 Jul 2011 15:20:40 -0400
Message-ID: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=bUq46aEfP7lKQmFP5HnGhUGLNbwacLEthZwdKHFCs8o=;
        b=Agx9JlC3O8LK2OWf6LxB0b03bfCS1gLTwpfr5GGAo+bJ1aipEuvyPUUXUvWLfgNhkM
         oj4FqzY3Eu9YzJPhkqDP3UaDEMf8C/urLcuCBzK3gM4xEGiKVEPSPPaUWep4XSGgnzbC
         bzIPCGfWeaXKTUlsG9g4aBtm1/z/WGsqLw85w=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I have IPSec setup between 2 hosts and would like to stop all
inter-host traffic thats not secured with IPSec (They have a GRE
tunnel between them, and I want to be sure the GRE traffic fails to
transmit if the IPSec daemon fails)

I'm testing from host hostA, trying to ping hostB.

This is what I've tried; allow only output traffic thats part of IPSec
to hostB. Else, reject it

iptables -A OUTPUT -p udp --dport 500 -d hostB.example.com -j ACCEPT
iptables -A OUTPUT -p tcp --dport 500 -d hostB.example.com -j ACCEPT
iptables -A OUTPUT -p esp -d hostB.example.com -j ACCEPT
iptables -A OUTPUT -d hostB.example.com -j REJECT

[root@hostA ~]# iptables -vL
Chain INPUT (policy ACCEPT 124 packets, 9920 bytes)
pkts bytes target =A0 =A0 prot opt in =A0 =A0 out =A0 =A0 source
destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target =A0 =A0 prot opt in =A0 =A0 out =A0 =A0 source
destination

Chain OUTPUT (policy ACCEPT 94 packets, 12768 bytes)
pkts bytes target =A0 =A0 prot opt in =A0 =A0 out =A0 =A0 source
destination
=A0 =A00 =A0 =A0 0 ACCEPT =A0 =A0 udp =A0-- =A0any =A0 =A0any =A0 =A0 a=
nywhere
hostB.example.com udp dpt:isakmp
=A0 =A00 =A0 =A0 0 ACCEPT =A0 =A0 tcp =A0-- =A0any =A0 =A0any =A0 =A0 a=
nywhere
hostB.example.com tcp dpt:isakmp
=A0 =A00 =A0 =A0 0 ACCEPT =A0 =A0 esp =A0-- =A0any =A0 =A0any =A0 =A0 a=
nywhere
hostB.example.com
=A0 =A08 =A0 864 REJECT =A0 =A0 all =A0-- =A0any =A0 =A0any =A0 =A0 any=
where
hostB.example.com reject-with icmp-port-unreachable
[root@hostA ~]#



The reject rule is rejecting all traffic to that host as you can see
from the pkt counter.=A0 If i remove that rule, everything works and i
see the packets get counted on the ESP protocol rule.=A0 I thought the
rules were processes in order until a match was found. Clearly I'm
wrong.

Is this possible without much complexity?
