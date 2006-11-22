From: Andy Furniss <lists@andyfurniss.entadsl.com>
Subject: Re: What happened to ipt_physdev.c ?
Date: Wed, 22 Nov 2006 17:04:54 +0000
Message-ID: <45648336.1010003@andyfurniss.entadsl.com>
References: <1164206481.456461916ec06@mail.third-rock.net>
Reply-To: lists@andyfurniss.entadsl.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1164206481.456461916ec06@mail.third-rock.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paul Reilly <paul@astropaul.com>
Cc: netfilter@lists.netfilter.org

Paul Reilly wrote:
> In recent kernels, 2.6.16.x   there is no longer any
> 
> net/ipv4/netfilter/ipt_physdev.c
> 
> and no option in kernel config to enable CONFIG_NETFILTER_XT_MATCH_PHYSDEV
> So I have no physdev in /proc/net/ip_tables_matches
> and my rules which include a -m physdev fail with:
> 
> iptables: No chain/target/match by that name
> 
> Has PHYSDEV been moved somewhere else?
> How do I enable it?
> 
> Paul
> 
> 

It's there in 17 & 19 somewhere :-)

grep -i phy /boot/config-2.6.19-rc6
...
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
...

