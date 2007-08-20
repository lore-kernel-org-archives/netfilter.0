From: Ruben Laban <r.laban@ism.nl>
Subject: Re: REJECT target not as policy
Date: Mon, 20 Aug 2007 16:08:39 +0200
Message-ID: <200708201608.39032.r.laban@ism.nl>
References: <20070820135206.GA18644@bart.bertram-scharpf.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070820135206.GA18644@bart.bertram-scharpf.homelinux.com>
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

On Monday 20 August 2007, Bertram Scharpf wrote:
> on one of my machines the REJECT target doesn't behave as I
> expect. It is inserted into a chain but it is not accepted
> as a policy.
>
> myhost ~ # iptables -L
> Chain INPUT (policy DROP 2 packets, 116 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination ...
>     0     0 REJECT     tcp  --  any    any     anywhere            
> anywhere    ... ...
>
> But:
>
> myhost ~ # iptables -v -t filter -P INPUT REJECT
> iptables: Bad policy name
>
>
> How comes this? I guess it is a kernel option I have to
> change. But which?

The REJECT target is only valid when either the tcp or udp module is loaded. 
Hence it cannot be used as a policy.

HTH
-- 
Ruben

