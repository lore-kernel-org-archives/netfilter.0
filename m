From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: kind of off topic but ... P166 w/ 64 MB RAM
Date: Sun, 28 Dec 2003 02:39:45 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312280239.45998.Antony@Soft-Solutions.co.uk>
References: <20031227192312.145741df.michael@bluesuperman.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031227192312.145741df.michael@bluesuperman.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sunday 28 December 2003 2:23 am, Michael Gale wrote:

> Hello,
>
> 	I got a little question, how many users do you think I could put behind
> a P166 w/ 64MB RAM with an old 3.5GB drive. ?
>
> It is a linux box (slackware) running 2.4.23 kernel with the latest
> Iptables.

The 64Mbytes RAM may be a bit of a limitation, but unless you've got a *fast* 
Internet connection (>50Mbits/sec), I'd say this box will support several 
hundred (maybe thousand) users.   If your Internet link is *fast*, tell us 
what speed, and you'll likely get some different opinions.

> I would also like to throw on Squid and FreeSwan IPSEC (1-2 VPN
> connections  only).

Aha.   That casts a very different light on things.

1. No way would I consider running Squid with 64Mbytes RAM and 3.5Gbytes disk.   
Maybe with ten times both of those, but not with that.

2. FreeS/WAN will increase the load on the machine noticeably.   Maybe not 
enough to affect your usage, but it will generate much more load than 
netfilter on its own.   Tell us what speed the link is and we'll think about 
it again.

I'd say the significance of the different elements you've mentioned here go in 
the following order:

(least significant) Netfilter
(middling) FreeS/WAN
(most significant) Squid

Therefore the biggest question is not "how many users" but "how many web 
browsers" do you have?   Maybe also tell us why you would like to put Squid 
on this box (do you want the caching, the logging, the filtering?) and we can 
better answer whether it's worth bothering at all with that application on 
this platform.

Hope this helps,

Antony.

-- 
Documentation is like sex.
When it's good, it's very very good.
When it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.


