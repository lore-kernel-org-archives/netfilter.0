From: Jason Opperisano <opie@817west.com>
Subject: Re: limiting connections
Date: Mon, 01 Nov 2004 08:45:42 -0500
Message-ID: <1099316742.3271.12.camel@hubcap.ljm.dom>
References: <20041101092621.GA6044@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041101092621.GA6044@tranquility.scriptkitchen.com>
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

On Mon, 2004-11-01 at 04:26, Payal Rathod wrote:
> Hi,
> As I mentioned in my previous mails, I use something like below to
> redirect connections from outside to my internal machine.
> # iptables -t nat -I PREROUTING -d <my_ext_ip> -p tcp --dport \
> 8081 -j DNAT --to-destination 192.168.0.16:80
> 
> But I want only say 3 connections allowed at a time from outside. How do I 
> do it in iptables?  I am not getting the exact syntax.
> 
> Thanks a lot in advance.
> With warm regards,
> -Payal

have a look at the connlimit patch from POM.

-j

--
"Man, you go through life, you try to be nice to people, you struggle
to resist the urge to punch 'em in the face, and for what?"
	--The Simpsons


