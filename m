From: paulobruck1 <paulobruck1@gmail.com>
Subject: Re: iptables + mangle for vlan not working
Date: Wed, 12 Aug 2009 20:15:37 -0300
Message-ID: <1250118937.4080.15.camel@pauloric.contatogs.com.br>
References: <1250117662.4133.12.camel@pauloric.contatogs.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:in-reply-to
         :references:content-type:date:message-id:mime-version:x-mailer
         :content-transfer-encoding;
        bh=06XGutNH+lCxUp44yL3AX9Wal7EAM2IHK3BayD8IWDM=;
        b=KxqAmtueHEOabmhKndOtRhsCe/bpE7XGuuehLiM7+2sn9UfVUWqiTZuUQjr7Owc+6x
         v3TlqyoGl9VWt+RejWORG+KRuMhWH2YiugpR2ndOCw6AuCAWyKQ4yly+lm35d3LgZb7U
         WmyRLwVdaQgEHC9aE4Fn1+iDmWUIF3nigE9xQ=
In-Reply-To: <1250117662.4133.12.camel@pauloric.contatogs.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi Guys

I working w/ iptables + iproute + balance and in one of our client w/
it's using VLAN every time that I start both links all vlan stop
working.

Debian Lenny w/ kernel 2.6.26-2-686-bigmem=20
iptables  	1.4.2-6=20
iproute 	20080725-2=20


just a small picture to clarify:


	wan1 - eth1    wan2 - eth2
		|      |

               firewall -------------------dmz - eth5
		|
	  lan ( bond0) eth0 and eth4
		10.0.0.2/24
		|
		|
	switch core
		|
		|

VLAN 10.0.1.0/24 10.0.2.0/24 10.0.2.0/24


After reading, googling and testing I discover that any time that both
links come w/ rule below VLAN stop passing though firewall

-------cut------------

Chain PREROUTING (policy ACCEPT 458 packets, 41906 bytes)
 pkts bytes target     prot opt in     out     source
destination
  231 17763 CONNMARK   all  --  eth1   *       0.0.0.0/0
0.0.0.0/0           CONNMARK restore
    0     0 MARK       all  --  eth1   *       0.0.0.0/0
0.0.0.0/0           mark match 0x0 state NEW MARK xset 0x1/0xffffffff
  231 17763 CONNMARK   all  --  eth1   *       0.0.0.0/0
0.0.0.0/0           CONNMARK save
   16  3135 CONNMARK   all  --  eth2   *       0.0.0.0/0
0.0.0.0/0           CONNMARK restore
    0     0 MARK       all  --  eth2   *       0.0.0.0/0
0.0.0.0/0           mark match 0x0 state NEW MARK xset 0x2/0xffffffff
   16  3135 CONNMARK   all  --  eth2   *       0.0.0.0/0
0.0.0.0/0           CONNMARK save
  108  8813 CONNMARK   all  --  bond0  *       0.0.0.0/0
0.0.0.0/0           CONNMARK restore
    3   444 CONNMARK   all  --  eth3   *       0.0.0.0/0
0.0.0.0/0           CONNMARK restore
   13   632 CONNMARK   all  --  bond0  *       0.0.0.0/0
0.0.0.0/0           mark match !0x0 CONNMARK save
    0     0 CONNMARK   all  --  eth3   *       0.0.0.0/0
0.0.0.0/0           mark match !0x0 CONNMARK save

Chain INPUT (policy ACCEPT 336 packets, 34819 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain FORWARD (policy ACCEPT 118 packets, 6863 bytes)
 pkts bytes target     prot opt in     out     source
destination
   59  3257 TTL        all  --  *      eth1    0.0.0.0/0
0.0.0.0/0           /* Mudando TTL do pacote para dar mais seguran=C3=A7=
a */
TTL set to 255
   16   936 TTL        all  --  *      eth2    0.0.0.0/0
0.0.0.0/0           /* Mudando TTL do pacote para dar mais seguran=C3=A7=
a */
TTL set to 255

Chain OUTPUT (policy ACCEPT 246 packets, 27229 bytes)
 pkts bytes target     prot opt in     out     source
destination
  134 12557 TTL        all  --  *      eth1    0.0.0.0/0
0.0.0.0/0           /* Mudando TTL do pacote para dar mais seguran=C3=A7=
a */
TTL set to 255
   24  1900 TTL        all  --  *      eth2    0.0.0.0/0
0.0.0.0/0           /* Mudando TTL do pacote para dar mais seguran=C3=A7=
a */
TTL set to 255
  231 22418 CONNMARK   all  --  *      *       0.0.0.0/0
0.0.0.0/0           CONNMARK restore
    0     0 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           multiport dports 20,21,80,443 mark match 0x0 state
NEW /* pacotes do squid via link1 */ MARK xset 0x1/0xffffffff
   16  1224 CONNMARK   all  --  *      *       0.0.0.0/0
0.0.0.0/0           mark match !0x0 CONNMARK save

Chain POSTROUTING (policy ACCEPT 363 packets, 37210 bytes)
 pkts bytes target     prot opt in     out     source
destination
  181 15315 CONNMARK   all  --  *      eth1    0.0.0.0/0
0.0.0.0/0           CONNMARK restore
   29  2149 MARK       all  --  *      eth1    0.0.0.0/0
0.0.0.0/0           mark match 0x0 state NEW MARK xset 0x1/0xffffffff
  181 15315 CONNMARK   all  --  *      eth1    0.0.0.0/0
0.0.0.0/0           CONNMARK save
   32  2188 CONNMARK   all  --  *      eth2    0.0.0.0/0
0.0.0.0/0           CONNMARK restore
   16  1252 MARK       all  --  *      eth2    0.0.0.0/0
0.0.0.0/0           mark match 0x0 state NEW MARK xset 0x2/0xffffffff
   32  2188 CONNMARK   all  --  *      eth2    0.0.0.0/0
0.0.0.0/0           CONNMARK save


I would appreciate any help


thanks in advanced


