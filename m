From: Jason Opperisano <opie@817west.com>
Subject: Re: configure firewall & NAT & cache with each other
Date: Mon, 31 Jan 2005 10:54:14 -0500
Message-ID: <20050131155414.GA24804@bender.817west.com>
References: <20050130041539.25496.qmail@web51905.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050130041539.25496.qmail@web51905.mail.yahoo.com>
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

On Sat, Jan 29, 2005 at 08:15:39PM -0800, Alireza Yazdani wrote:
> 
> Hello all,
> 
> I have 2 box for cache, bandwidth manager, firewall, NAT .
> 
> one box is cache server(squid) only. and another box is bandwidth manager, firewall, NAT server.
> 
> I haven't any rule on my squid box. the default gateway of my users is my firewall box. my firewall box has 2 ethernet(user side and internet side).
> 
> ip of firewall box is :
> 
> iptables_box_ILAN=172.16.5.5 (user side)(eth0)
> 
> iptables_box_WLAN=212.213.38.100 (internet side)(eth1)
> 
> ip of cache box is :
> 
> squid_box=172.16.5.6
> 
> the default gateway of cache box is firewall box
> 
> I use of this rule for NAT :
> 
> iptables -t nat -A POSTROUTING -s 172.16.5.0/24 -o eth1 -j SNAT --to 212.213.38.100
> 
> now I want redirect the request on port 80 to cache box :
> 
> local_network=172.16.5.0/24
> 
> iptables_box_ILAN=172.16.5.5
> 
> iptables_box_WLAN=212.213.38.100

<-- snip -->

http://www.squid-cache.org/WCCP-support/Linux/

-j

--
"Well, I'm not calling you a liar, but... I can't think of a way to
 finish that sentence."
        --The Simpsons

