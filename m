From: Kjetil Andreas Laasby <list@laasby.com>
Subject: Re: Tightening up outgoing traffic
Date: 15 Oct 2002 15:18:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034687894.8681.53.camel@Wiggum>
References: <1034686034.15446.38.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1034686034.15446.38.camel@localhost.localdomain>
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
To: Neil Hodge <neh@attbi.com>
Cc: netfilter@lists.netfilter.org

Problably because yahoo.com lies in your local DNS cache or on an cache
server behind your firewall.

add
iptables -A OUTPUT -p tcp --destination-port domain -j ACCEPT
iptables -A OUTPUT -p udp --destination-port domain -j ACCEPT

also.

You should also open up RELATED ICMP to minimize delay for errors.

hth,
Kjetil Laasby.

> All:
> 
> I am running directly off the firewall box.  I currently have the
> following:
> 
> iptables -P OUTPUT ACCEPT
> 
> When I change to this:
> 
> iptables -P OUTPUT DROP
> iptables -A OUTPUT -p tcp --destination-port http -j ACCEPT
> 
> I keep getting "domainname can not be found.  Please check the name and
> try again" from my browser.  This only happens for new web sites (i.e.,
> Yahoo works fine).  As this seems somewhat like a DNS issue, I tried
> adding this:
> 
> iptables -A OUTPUT -p tcp --destination-port nameserver -j ACCEPT
> 
> but it didn't work.  Any ideas?  Thanks.
> 
> Neil Hodge
> 
> 
> 


