From: Glen Miner <shaggie76@hotmail.com>
Subject: RE: Stateless NAT with iptables
Date: Mon, 12 Jan 2015 14:25:50 -0500
Message-ID: <SNT152-W824409292D95C958E794CDB8430@phx.gbl>
References: <alpine.LSU.2.11.1501100027160.13352@nerf60.vanv.qr>,<SNT152-W95408B1CE91E099E55A7ADB8430@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <SNT152-W95408B1CE91E099E55A7ADB8430@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> However, I've tried to get it to work and must be missing something s=
ubtle.

More diagnostics on this approach not working out:

If I watch the conntrack event log with conntrack -E -p udp

The iptables -t nat... method logs this:

=A0 =A0 [NEW] udp =A0 =A0 =A017 30 src=3D10.0.1.7 dst=3D10.0.1.8 sport=3D=
5000 dport=3D5001 [UNREPLIED] src=3D10.0.1.7 dst=3D10.0.1.8 sport=3D500=
3 dport=3D5002

But the conntrack -I ... method logs this:

=A0[UPDATE] udp =A0 =A0 =A017 120 src=3D10.0.1.7 dst=3D10.0.1.8 sport=3D=
5000 dport=3D5001 [UNREPLIED] src=3D10.0.1.7 dst=3D10.0.1.8 sport=3D500=
3 dport=3D5002 mark=3D0

(note that I double checked that there were no previously existing udp =
entries in the table so I can't explain the update vs new).=A0

-g

 		 	   		  