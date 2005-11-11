From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: NAT with Multiple Public IPs
Date: Fri, 11 Nov 2005 13:22:10 -0500
Message-ID: <1131733330.3674.24.camel@localhost>
References: <00d001c5e6e8$965cc330$09603fca@southern>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00d001c5e6e8$965cc330$09603fca@southern>
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
To: hareram <hareram@sol.net.in>
Cc: netfilter@lists.netfilter.org

On Fri, 2005-11-11 at 23:21 +0530, hareram wrote:
> Hi all
> 
> iam trying to build more than 1000 users network
> 
> now days i see some problem with yahoo
> 
> if using one IP source NAT, yahoo blocking that IP due to some problems come 
> with that IP
> 
> so how can make NAT using 255 IP
> with 1000users
> 
> this should do randomly using 255 IP;s
> 
> any examples
> 
> hare 
> 
> 
> 
One can NAT to a range of IP addresses.  That used to produce a rough
round robin distribution of addresses; I'm not sure if that is still the
case.  Thus you would have:

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source
1.1.1.1-1.1.1.254 
or something similar.

Although it is not complete, the ISCS network security management
project (http://iscs.sourceforge.net) automates the creation of even the
most complex NAT including many to some, some to many, overlapping and
nested NAT.  Good luck - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


