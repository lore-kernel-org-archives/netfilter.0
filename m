From: jack seth <bird_112@hotmail.com>
Subject: Why can't I access my modem using Openvpn?
Date: Wed, 2 Oct 2013 00:51:15 +0000
Message-ID: <SNT147-W80335136C068A867D37283BF160@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Here is my setup.=A0 My dsl modem is attached to the WAN port of my rou=
ter.=A0 Vlan2 is the WAN port interface.=A0 Vlan2 has been assigned an =
IP address (192.168.1.253) in the same subnet as the modem to allow acc=
ess.=A0 This rule is used to make it work 'iptables -I POSTROUTING -t n=
at -o vlan2 -d 192.168.1.254 -j MASQUERADE'=A0 With this setup from ins=
ide my lan (on a different subnet) I can still access the dsl modem.=A0=
=A0 Tap0 is my openvpn interface.=A0 It is part of the bridge 'br0' and=
 gets assigned an ip address within the same subnet as my lan.=A0=A0 Ef=
fectively, when using Openvpn I become part of my lan and can access la=
n resources.=A0 So far so good. Here is the problem.=A0 When testing op=
envpn from public wifi, I can't access the dsl modem.=A0 I am on my lan=
 as I can access other things.=A0 I can access my dsl modem testing ope=
nvpn from inside my lan, just not from the outside.=A0 When I remotely =
connect, I want EVERYTHING to be as if I were on my lan.=A0 I don't get=
 why this doesn't work.=A0 Is there a rule that I am missing that would=
 solve this? 		 	   		  