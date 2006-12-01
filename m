From: Daniel Musketa <Daniel@musketa.de>
Subject: Re: how do I set the MAC address in POSTROUTING?
Date: Fri, 1 Dec 2006 01:53:55 +0100
Message-ID: <200612010153.55904.Daniel@musketa.de>
References: <eknslc$rpq$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <eknslc$rpq$1@sea.gmane.org>
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

On Friday 01 December 2006 01:23, sean wrote:
>   MAC-ADDRESS-TEST: IN=ppp0 OUT= MAC= SRC=ww.xx.yy.zz

> Is this even an iptables issue? 

AFAIK MAC addresses are used in ethernet to address ethernet frames. On ip 
routed ppp0 no ethernet frames arrive.

Daniel

