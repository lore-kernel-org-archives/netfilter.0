From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: PLEASE HELP with DNAT problem
Date: Fri, 31 Oct 2003 13:57:14 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A28AC9F@wardrive.citadelcomputer.com.au>
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
To: ml@proficuous.com, netfilter@lists.netfilter.org

> I tried to DNAT the lan back=20
> to itself and
> it just isn't working..

If I think I know what your trying to do, you are doing a LAN to LAN =
connection right?

Don't forget that a LAN to LAN DNAT also must have a POSTROUTING SNAT =
rule so the destination server replies back via the firewall/NAT server. =
otherwise it'll reply directly to the client and the client will drop =
the packet immediately.

Have you done any tcpdumping or -j LOGing??

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

> -----Original Message-----
> From: ml@proficuous.com [mailto:ml@proficuous.com]
> Sent: Friday, 31 October 2003 1:18 PM
> To: netfilter@lists.netfilter.org
> Subject: PLEASE HELP with DNAT problem

