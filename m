From: Per Jessen <per@computer.org>
Subject: basic load distribution using -m statistic --mode nth
Date: Thu, 27 Mar 2008 19:58:36 +0100
Message-ID: <47EBEE5C.9030503@computer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I'm trying to set up basic load distribution using the following:

iptables -t nat -A OUTPUT  -d $addr -p udp --dport 53 -m
statistic --mode nth --every 2 --packet 0 -j DNAT --to $fe1
iptables -t nat -A OUTPUT  -d $addr -p udp --dport 53 -m
statistic --mode nth --every 2 --packet 1 -j DNAT --to $fe2

(I know I can achieve pretty much the same using "options rotate"
in resolv.conf, but humour me).

I'm testing the setup with a simple "dig <host>", and it seems
to be working, except that I get a hang ("no servers could be
reached") on every 4th query.  It is a consistently reproducable
behaviour.

I'm using iptables 4.0 and kernel 2.6.24.3.  Can anyone spot
anything I've missed?


thanks
Per Jessen, Z=FCrich
