From: =?iso-8859-1?Q?S=F8ren_Kent_Jensen?= <soren@familie-jensen.dk>
Subject: Re: UDP DNAT Problem
Date: Fri, 4 Apr 2003 18:25:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00c601c2fac6$cf1c4440$0223a8c0@soren>
References: <Pine.LNX.4.44.0303071043540.20848-100000@linux1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter <netfilter@lists.netfilter.org>

Try http://www.zelow.no/floppyfw/

Regards
S=F8ren Kent Jensen

----- Original Message -----
From: "Craig Packard" <cpackard@zoominternet.net>
To: "Ralf Spenneberg" <lists@spenneberg.org>
Cc: "Netfilter" <netfilter@lists.netfilter.org>
Sent: Friday, March 07, 2003 5:47 PM
Subject: Re: UDP DNAT Problem


> On 4 Apr 2003, Ralf Spenneberg wrote:
>
> > Am Fre, 2003-04-04 um 05.14 schrieb Craig Packard:
> >
> > > The packet goes out as expect srcA dstB
> > > But the weird part is the response comes back in srcFW dst(A)   Whe=
re
I would like it would be src(B) dst(A)!!!
> > Are you sure, that you do not have any SNAT rule that might be
> > responsible?
> > Post your PRE- and POSTROUTING chains.
> >
>
> Thanks a TON for any help.  Have been stuck on this for a week!
>
> Here is the chains. (I changed the last number in the internet IP to * =
to
> slightly hide my location.)  On my box it of course shows my proper
> outside address.
>
>
>
> [root@linux1 firewall_rules]# iptables -t nat -L
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> DNAT       udp  --  anywhere
> acs-24-154-175-*.zoominternet.netudp dpt:5198 to:192.168.25.11:5198
> DNAT       udp  --  anywhere
> acs-24-154-175-*.zoominternet.netudp dpt:5199 to:192.168.25.11:5199
>
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> MASQUERADE  all  --  anywhere             anywhere
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
>
>



