From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: is this ip spoofing?
Date: Mon, 18 Aug 2003 11:05:14 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308181049080.31438-100000@localhost>
References: <20030817022857.GA1426@linux.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030817022857.GA1426@linux.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Payal Rathod <payal-iptables@staticky.com>
Cc: netfilter@lists.netfilter.org

Hi Payal,

> I don't know much about SNAT. But is this equivalent to i-spoofing in
> such case? Is this how SNAT works?
> 
> Assume I have a internal ip 192.168.0.10. All traffic coming from it
> should be seem as coming from 202.1.1.1. So I use SNAT and POSTROUTING
> and now connection seems to take place from 202.1.1.1. But isn't it
> similar to ip-spoofing?

Technically, I suppose that IP spoofing is simply generating a packet 
where the source address is not an address of your own machine. I suppose 
that SNAT is one way of achieving that, although there are far easier ways 
if that's all you want to do, and SNAT can also be used for non-spoofing 
purposes, such as rewriting to an alias on your machine.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


