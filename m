From: Jason Opperisano <opie@817west.com>
Subject: Re: browser header
Date: Thu, 17 Feb 2005 14:15:52 -0500
Message-ID: <1108667752.4629.69.camel@hubcap.ljm.dom>
References: <web-638429877@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <web-638429877@mail01.infosat.net>
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
To: netfilter@lists.netfilter.org

On Thu, 2005-02-17 at 14:01, it clown wrote:
> Hi All,
> 
> I am running iptables with squid. I did a Browser header
> test and the test shows the following:
> 
> Via: 1.1 pc.domain.net:3128 (squid/2.5.STABLE5), 1.0
> netcache2-ctn (NetCache NetApp/5.3.1R2)

you're running iptables and squid on a Network Appliance NetCache?  or
is there a NetCache between you and the web server that isn't under your
control?

> Why is it showing my pc's host name? 

because it's supposed to.

> How do i prevent it
> from happening?
> 
> Do i need to do something in iptables or squid?

well--which one handles all your HTTP connections?

never mind...add these to squid.conf:

  header_access Via deny all
  header_access X-Forwarded-For deny all

this assumes that the proxy server that's selling you out is actually
under your control, and not somewhere upstream from you.

-j

--
"If something is to hard to do, then it's not worth doing."
	--The Simpsons


