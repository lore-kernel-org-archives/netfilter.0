From: Jason Opperisano <opie@817west.com>
Subject: Re: SNAT or SAME logging
Date: Thu, 23 Jun 2005 10:20:09 -0400
Message-ID: <20050623142009.GA16600@bender.817west.com>
References: <001201c577b2$531ed220$130aa8c0@winxp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001201c577b2$531ed220$130aa8c0@winxp>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Jun 23, 2005 at 08:13:43AM +0300, Wennie V. Lagmay wrote:
> Hi all,
> 
> Im using Iptables (SAME) to translate my private IP address to Public IP 
> address, I just want to know how can I monitor and log which Public IP 
> address is used by a specific private IP address.
> 
> Example:
> 
> -A POSTROUTING -s 192.168.10.0/255.255.255.0 -j SAME --nodst --to 
> 212.xxx.xxx.113-212.xxx.xxx.114
> -A POSTROUTING -s 192.168.11.0/255.255.255.0 -j SAME --nodst --to 
> 212.xxx.xxx.115-212.xxx.xxx.116
> 
> On the example above private IP block 192.168.10.0/24  was map to used 
> 212.xxx.xxx.113  to 212.xxx.xxx.114. How can I idenfify lets say 
> 192.168.10.10/24 is using xxx.113 or xxx.114 at any given time.

  grep $SRCIP /proc/net/ip_conntrack

the last dst= is the SNAT IP.

-j

--
"Stewie: What the hell is this?
 Lois: Stewie that's tuna salad.
 Stewie: Really? I could have sworn it was cat food."
        --Family Guy

