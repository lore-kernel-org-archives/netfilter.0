From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: External IP addresses on internal network
Date: Wed, 27 Aug 2003 08:43:45 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C1B5@wardrive.citadelcomputer.com.au>
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
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>, netfilter@lists.netfilter.org

This could be an internal machine querying aol.com dns server.. which is =
harmless..

can you show come tcpdumps of this? Was the source IP the aol.com =
address or was it just the destination.. I would be worried if it was =
the source IP and it was going out, not in. If it was coming in then =
don't panic though I woudl prefer to run a caching DNS server locally =
and block DNS going out.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au
=20

-----Original Message-----
From: Jeffrey Laramie [mailto:JALaramie@Loudoun-Fairfax.com]
Sent: Wednesday, August 27, 2003 1:57 AM
To: netfilter@lists.netfilter.org
Subject: External IP addresses on internal network


Hi all,

I recently updated my configuration by modifying one of my filter INPUT=20
rules to specify source IPs coming in from the LAN:

iptables -t filter -A INPUT -p all -i $LAN_Interface -s $LAN_IP_Range -j =

Lan-Host

Packets not meeting this condition (among others) are logged and=20
dropped. The intent is to catch any internal packets coming from an=20
external IP address. No sooner did I load this rule when I started=20
logging packets with an AOL IP address coming from the LAN interface=20
going to port 53. I have a small LAN with only a handful of PCs which I=20
configured myself, so I'm a bit puzzled.

Have I configured this wrong? Several users connect to AOL through the=20
firewall so that's a possible cause, but I don't know why an AOL program =

would spoof IPs. Thoughts?



