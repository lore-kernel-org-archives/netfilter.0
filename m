From: Eduardo Ukstin <ukstin@gmail.com>
Subject: Re: pptp_conntrack_nat and kernel 2.6.15
Date: Thu, 5 Jan 2006 18:12:19 +0000
Message-ID: <bb8a5cd0601051012q4eb9d269y99221fb9f0e5141c@mail.gmail.com>
References: <200601032253.08997.jesus.salvo@optusnet.com.au>
	<200601060415.17980.jesus.salvo@optusnet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200601060415.17980.jesus.salvo@optusnet.com.au>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

do you know if this kernel works with ipsec too??

Regards
Eduardo Ukstin


On 1/5/06, Jesus M. Salvo Jr. <jesus.salvo@optusnet.com.au> wrote:
> On Tuesday 03 January 2006 22:53, Jesus M. Salvo Jr. wrote:
> >
> > So am I right to assume that:
> >
> > 1) The patch-o-matic for pptp_conntrack_nat is no longer needed if one =
uses
> > 2.6.15 kernels ?
> >
> > 2) A linux gateway with 2.6.15 kernel and IP and VPN masquerading and w=
ith
> > the above modules loaded  will finally allow mutliple clients within th=
e
> > LAN to connect to a remote PPTP server ??
> >
> > Thanks.
> >
> > John
>
> I would like to report that multiple outgoing PPTP connections from withi=
n a
> LAN via IP / VPN / PPTP masquerading now works with 2.6.15 ... without ha=
ving
> to use patch-o-matic extras pptp_conntrack_nat
>
> You __will__ have to load the following modules for it to work:
>
> /sbin/modprobe ip_nat_pptp
> /sbin/modprobe ip_conntrack_pptp
>
>


--
Eduardo Ukstin
GNU/Linux User #328388

