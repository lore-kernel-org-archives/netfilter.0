From: Philip Craig <philipc@snapgear.com>
Subject: Re: iptables - resource temporary unavailable
Date: Thu, 08 Jun 2006 10:34:52 +1000
Message-ID: <448770AC.6030209@snapgear.com>
References: <004901c68a07$99c5f790$0e01050a@robee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004901c68a07$99c5f790$0e01050a@robee>
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
To: robee <mlody@elpec.com>
Cc: netfilter@lists.netfilter.org

On 06/07/2006 05:54 PM, robee wrote:
> any time when i'm restarting my firewall rules (NAT mostly, about 500 users) 
> i got this error -> iptables - resource temporary unavailable.
> but, if i unplug users (main switch off) and restart firewall everyting is 
> fine
> my system is fedora core 4, iptables 1.3.5, kernel 2.6.16.18

I don't think it is lack of memory, the error message for that
includes the word memory.  Resource temporarily unavailable means
that something else is currently using the resource.  Is it
possible that another iptables instance is running at the same time?


