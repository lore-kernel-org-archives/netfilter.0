From: "Maciej Soltysiak" <solt@dns.toxicfilms.tv>
Subject: Re: ip6tables and -m state
Date: Thu, 11 Dec 2003 09:11:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001f01c3bfbe$6b26c420$0e25fe0a@southpark.ae.poznan.pl>
References: <1071115593.28281.4.camel@tribeca.formanonline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Jeffrey Forman <jforman@formanonline.com>, netfilter@lists.netfilter.org

> i was wondering if there is a way to do connection tracking with
> ip6tables as ipv4 iptables does? so for example, i want to do:
> iptables -A INPUT -i eth0 -m state -state established,related -j ACCEPT
>
> but with ipv6 and ip6tables. any idea? whether one rule or many..
So far there is no official connection tracking for ipv6.
There were some attempts to do this, for instance
yasuyuki kozakai's latest patch:
http://lists.netfilter.org/pipermail/netfilter-devel/2003-September/012572.html

Anyway, please read Harald's reply on this:
http://lists.netfilter.org/pipermail/netfilter-devel/2003-September/012555.html

Regards,
Maciej


