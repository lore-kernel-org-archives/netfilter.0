From: William Stearns <wstearns@pobox.com>
Subject: Re: DNAT based on domain name instead of IP address
Date: Wed, 28 Jan 2004 18:59:29 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0401281849230.28123-100000@sparrow>
References: <1075332153.25415.98.camel@child-of-god.holiness.ch>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075332153.25415.98.camel@child-of-god.holiness.ch>
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
To: Glen Lee Edwards <glen@holiness.ch>
Cc: ML-netfilter <netfilter@lists.netfilter.org>, William Stearns <wstearns@pobox.com>

Good evening, Glen,

On 28 Jan 2004, Glen Lee Edwards wrote:

> I have several domains that use the same IP address.  Can I DNAT them to
> different servers based on domain name instead of IP address using
> iptables?  I've tried the following, but it isn't working:
> 
> iptables -t nat -A PREROUTING -p tcp -d 1st.domain.com --dport 80 -j
> DNAT --to-destination 192.168.1.12:80
> 
> iptables -t nat -A PREROUTING -p tcp -d 2nd.domain.com --dport 80 -j
> DNAT --to-destination 192.168.1.13:80
> 
> Everything is being forwarded to 192.168.1.12 no matter which domain is
> used.  It appears that the domains are first being translated into the
> IP address, which is used instead.

	You're last statement explains what's happening, and you're 
exactly right.  Even if you use domain names on the command line, iptables 
converts them to ip addresses before handing them off to the kernel.

	Iptables isn't really capable of what you're asking; it's 
primarily designed to make choices about packets based on header 
information.  Although some components of it can inspect the payload, it's 
not capable of doing the differentiation you need.
	What you want is a userspace application that can look in the 
payload of the packet and identify the Host: header in an http request, 
and send the connection off to the right web server based on that header.
	One place to start is the squid cache ( 
http://www.squid-cache.org ) and the httpd_accel_* options.
	Cheers,
	- Bill

---------------------------------------------------------------------------
        "We don't want an election without a paper trail...all three
owners of the companies who make these machines are donors to the Bush
administration.  Is this not corruption?"
        -- Gore Vidal
(Courtesy of http://www.laweekly.com/ink/03/52/features-cooper.php)
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
--------------------------------------------------------------------------


