From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: iptables and wifi access point
Date: Mon, 28 Jul 2003 08:04:18 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BFD0@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Jason <arnjuka@optonline.net>, netfilter@lists.netfilter.org

1. Security =3D Forget WEP (or even 128bit WEP.. it sucks.). Use IPSEC =
tunnels over wifi.
2. You can setup the wifi cards ethernet name to be anything, ie wifi0 =
or eth10. Makes scripting easier.
3. DO NOT USE MAC FILTERING... Wifi can easily be spoofed mac addresses =
hence the reason for number 1 above.
4. Remember in some/most/all countries that subleasing internet access =
is illegal without a carrier license (it is in Australia, dunno about =
anywhere else)..


Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Jason [mailto:arnjuka@optonline.net]
Sent: Monday, July 28, 2003 6:00 AM
To: netfilter@lists.netfilter.org
Subject: iptables and wifi access point


Hi all, this is my first time writing here.  Here goes.

I'm setting up an accesspoint with a redhat9 box and a prism 2 netgear
wifi card.  The box has the wifi adapter and two wired nic adapters.
The wifi is for the access point and all the clients that will connect
to it, one nic is for the dsl, and the other is for wired machines on
the network.

I wanted to use iptables and cbq {i think} for routing/firewalling and
bandwidth limiting and shaping.  If anyone has done this before and
maybe has sample config files, or if you know any good docs to read
please point me in the right direction.

I want to make the network as secure as possible and as accessable as
possible.  Sorry for asking such a broad question, I'm just hoping that
someone has done this already, or someone might have some ideas for me.

TIA,
Jason




