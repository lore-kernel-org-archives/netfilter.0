From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: NAT only some ports
Date: Mon, 10 Feb 2003 17:03:20 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302101703.20156.netfilter@newkirk.us>
References: <3E47F7E0.2E4CACC1@wildapache.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E47F7E0.2E4CACC1@wildapache.net>
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
To: Del Winiecki <delw@wildapache.net>, netfilter@lists.netfilter.org

On Monday 10 February 2003 02:05 pm, Del Winiecki wrote:
> Hi,
>
> I have a Linux router box configured:
>
> Wanpipe1: upstream isp
> eth1: downstream isp1 -- (public address 209.aaa.aaa.x) must not be
> Nat'd
> eth2: downstream isp2 --   same 209.bbb.bbb.x
> eth3: company1 on 192.168.254/253/252.0 (3 class c private) must be
> NAT'd
> eth4: company2 on 192.168.1.0/24 must NAT'd
>
> All NAT'd "outside" addresses should show as one of isp1's addresses,
> so just one fixed public address like 209.aaa.aaa.13, for example.
>
> Is it possible to accomplish this with iptables?

Certainly.  You just introduce some matches into the NAT rules.  I assume=
=20
you're talking about SNAT, to make outbound traffic heading upstream=20
appear from only the 209.aaa.aaa.xxx address range, right? If you can=20
isolate isp1's IP space, you could match "-s ! 209.aaa.aaa.x/yy" in the=20
nat POSTROUTING rule that performs the SNAT and SNAT anything NOT in=20
that ip range.  If the only things you want to SNAT are the private IPs,=20
just use "-s 192.168.0.0/16" or something similar to match only that=20
traffic.

> Del W.

j


