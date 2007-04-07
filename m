From: Martijn Lievaart <m@rtij.nl>
Subject: Re: iptables, multiple hosts, one IP
Date: Sat, 07 Apr 2007 10:25:28 +0200
Message-ID: <46175578.3050600@rtij.nl>
References: <06fe01c778ad$c063a6a0$7c01a8c0@peg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <06fe01c778ad$c063a6a0$7c01a8c0@peg>
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
To: jj <jj_rocks2003@yahoo.com>
Cc: netfilter@lists.netfilter.org

jj wrote:
> Hi,
>
> I searched all over the internet, but cant find this in any forum, so
> hopefully someone can help.  I dont even know if iptables can help, but
> hopefully it will.
>
> I have only dedicated IP address, and I have 3 hosts (same for physical or
> virtual hosts, I guess) and what I would like is:
>
> to have each host have its own LAMP hosting its own domains, but from the
> outside world, everyone should only see www.whatever.tld, without the need
> to add port numbers, etc
>
> can this be done with some form of iptables, apache redirects (via a control
> panel like ispconfig, or similar)?
>   

Use apache with mod_proxy. This cannot be done with iptables, the 
hostname is not in the first packet (the SYN) that iptables sees, after 
that it is to late to do anything about it as you cannot suddenly rejank 
the connection to another host.

> can it be done, or must I have multiple dedicated IP's?
>   

For https you will need dedicated ips, for http use mod_proxy.

HTH,
M4


