From: Babelo Gmvsdm <hercule18@hotmail.com>
Subject: Iptables DNAT and redirect on interface in promiscuous mode
Date: Thu, 12 Jan 2012 10:14:15 +0100
Message-ID: <BLU158-W265CEEC64CDB7F3707B4E2A69F0@phx.gbl>
References: <BLU158-W307A56E564B30DAD3791BA69F0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU158-W307A56E564B30DAD3791BA69F0@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


=A0Hi,
=A0I have a PC which is connected to a mirroring port with an interface=
 in promiscuous mode.I would like to catch traffic on this interface, a=
nd redirect it to port 3128 (squid app).
=A0The promiscuous mode by another app running on this interface (ntop)
=A0But it seems the promiscuous mode prevent iptable from working.
=A0is there any trick to make it works?
=A0ps: sorry for my english.

=A0HerC.
 		 	   		  