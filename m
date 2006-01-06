From: "Jesus M. Salvo Jr." <jesus.salvo@optusnet.com.au>
Subject: Re: pptp_conntrack_nat and kernel 2.6.15
Date: Sat, 7 Jan 2006 09:24:24 +1100
Message-ID: <200601070924.24644.jesus.salvo@optusnet.com.au>
References: <200601032253.08997.jesus.salvo@optusnet.com.au>
	<200601060415.17980.jesus.salvo@optusnet.com.au>
	<bb8a5cd0601051012q4eb9d269y99221fb9f0e5141c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bb8a5cd0601051012q4eb9d269y99221fb9f0e5141c@mail.gmail.com>
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


> On 1/5/06, Jesus M. Salvo Jr. <jesus.salvo@optusnet.com.au> wrote:
> > I would like to report that multiple outgoing PPTP connections from
> > within a LAN via IP / VPN / PPTP masquerading now works with 2.6.15 ...
> > without having to use patch-o-matic extras pptp_conntrack_nat
> >
> > You __will__ have to load the following modules for it to work:
> >
> > /sbin/modprobe ip_nat_pptp
> > /sbin/modprobe ip_conntrack_pptp

On Friday 06 January 2006 05:12, Eduardo Ukstin wrote:
> do you know if this kernel works with ipsec too??
>
> Regards
> Eduardo Ukstin
>

I have no idea ... although I cannot see why this or previous kernels cannot 
do so.

I was reading your original post about "VPN rules". Although a bit old, the 
following link will still have some relevant information:

	http://www.faqs.org/docs/Linux-HOWTO/VPN-Masquerade-HOWTO.html


