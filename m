From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: help needed-VPN
Date: Tue, 27 May 2003 20:55:27 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D05@wardrive.citadelcomputer.com.au>
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
To: Steven Mugassa <steven.mugassa@intafrica.com>, netfilter@lists.netfilter.org
Cc: owner-cipe-l@inka.de, cipe-l@inka.de

ha haaa!!! A sneeaky way of doing thing is one way..

There is a trade off on the idea I have but here goes..

You maquerade your LAN B machines to access lan A workstation. This LAN =
A workstation won't need a static route to LAN B because it'll appear as =
the firewall/VPN machine because you've MASQUERADED it..

trade off is that every machine in LAN B will appear as the firewall..

I'm not familiar with CIPE so dunno if this will work for you..

-----Original Message-----
From: Steven Mugassa [mailto:steven.mugassa@intafrica.com]
Sent: Tuesday, May 27, 2003 7:40 PM
To: netfilter@lists.netfilter.org
Cc: owner-cipe-l@inka.de; cipe-l@inka.de
Subject: help needed-VPN




Hello,

I'm trying to implement VPN of two remote LANs(LAN A & LAN B) using CIPE =
(on
RedHat 9.0). I have tried to follow instructions from "CIPE-How to" from
tldp.org and it seems to work (the machines on the two LANs can ping &
traceroute each other using the internal IP addresses)

However i have one more requirement which i need advice on how to do =
it:-
-One of the machines(call it machine X) in LAN B is not using CIPE =
gateway
as its gateway( it is going to the internet using another gateway, which =
is
also in the same LAN). This machine don't need to access machines in LAN =
A,
but machine in LAN A need to access this machine. Since this machine is
using another gateway(not CIPE gateway), then the classical CIPE-based =
VPN
implementation will not allow it to be accessible by remote LAN.

-My question is, what modifications (routings, or SNAT/DNAT, ...) can i =
do
to allow machine in remote LAN A to access that machine X (in LAN B)?

Thanks,
Steven




