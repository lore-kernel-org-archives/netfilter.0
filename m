From: "Jesus M. Salvo Jr." <jesus.salvo@optusnet.com.au>
Subject: Re: pptp_conntrack_nat and kernel 2.6.15
Date: Tue, 3 Jan 2006 23:04:48 +1100
Message-ID: <200601032304.49004.jesus.salvo@optusnet.com.au>
References: <200601032253.08997.jesus.salvo@optusnet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200601032253.08997.jesus.salvo@optusnet.com.au>
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

On Tuesday 03 January 2006 22:53, Jesus M. Salvo Jr. wrote:
>
> So am I right to assume that:
>
> 1) The patch-o-matic for pptp_conntrack_nat is no longer needed if one uses
> 2.6.15 kernels ?
>
> 2) A linux gateway with 2.6.15 kernel and IP and VPN masquerading and with
> the above modules loaded  will finally allow mutliple clients within the
> LAN to connect to a remote PPTP server ??
>
> Thanks.
>
> John

Do I need to update iptables from 1.2.11 to 1.3.x for pptp_conntrack_nat to 
work ?


