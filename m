From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: upgrade to iptabels from ipchains
Date: Wed, 28 May 2003 09:11:43 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A01924C@wardrive.citadelcomputer.com.au>
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
To: Esteban <eribicic@sinectis.com>, netfilter@lists.netfilter.org

Yes you can? You haven't reasearch much have you?

Do this...

IPCHAINS=3D"/sbin/iptables"   # ;)

Just remember that iptables structure is different to ipchains in that =
INPUT is no longer part of the forwarding line.. it handles packets =
destined for itself ONLY..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

=20

-----Original Message-----
From: Esteban [mailto:eribicic@sinectis.com]
Sent: Wednesday, May 28, 2003 8:02 AM
To: netfilter@lists.netfilter.org
Subject: upgrade to iptabels from ipchains


i used to have this:

$IPCHAINS -N soporte
$IPCHAINS -A FORWARD -s 10.0.0.0/25  -j soporte
$IPCHAINS -A soporte -s 10.0.1.1 -j MASQUERADE
$IPCHAINS -A soporte -j DENY

how can i do this with iptables?
the idea is to use chains for each group.

thanks!





