From: Oskar Andreasson <blueflux@koffein.net>
Subject: Re: ip_conntrack_ftp and ip_nat_ftp modules unused
Date: Sat, 7 Sep 2002 13:05:43 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209071302380.2411-100000@laptop1.agatha>
References: <1031358907.3d7949bb350b0@webmail3.webfluxation.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1031358907.3d7949bb350b0@webmail3.webfluxation.com>
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
To: Marcel Hauser <marcel_hauser@gmx.ch>
Cc: netfilter@lists.netfilter.org

On Sat, 7 Sep 2002, Marcel Hauser wrote:

> Hi 
> 
> I'am just wondering:
> 
> #lsmod
>  
> Module                  Size  Used by
> ipt_REJECT              3200   1  (autoclean)
> ipt_multiport            928   3  (autoclean)
> ipt_LOG                 3696   3  (autoclean)
> ipt_state                832  12  (autoclean)
> ip_nat_irc              2752   0  (autoclean) (unused)
> ip_conntrack_irc        2928   0  (autoclean) (unused)
> ip_nat_ftp              3296   0  (autoclean) (unused)
> iptable_nat            16112   3  (autoclean) [ip_nat_irc ip_nat_ftp]
> ip_conntrack_ftp        3632   0  (autoclean) (unused)
> ip_conntrack           15568   4  (autoclean) [ipt_state ip_nat_irc 
> ip_conntrack_irc ip_nat_ftp iptable_nat ip_conntrack_ftp]
> iptable_filter          1936   1  (autoclean)
> ip_tables              11584   8  [ipt_REJECT ipt_multiport ipt_LOG ipt_state 
> iptable_nat iptable_filter]
> 
> is it normal that ip_conntrack_ftp and ip_nat_ftp are unused ??

Yes, no other modules are using them, but they may still be used by 
conntrack or nat to understand what is related to other connections. In 
other words, the unused flag presented by lsmod has nothing to do with the 
fact that it may be used for something, such as connection tracking or 
anything else.

> 
> Thanks
> 
> Marcel
> 
> 
> 

-- 
----
Oskar Andreasson
http://iptables-tutorial.haringstad.com
http://people.unix-fu.org/andreasson/
mailto:blueflux@koffein.net


