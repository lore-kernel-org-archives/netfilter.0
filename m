From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall question...
Date: Tue, 30 Mar 2004 10:58:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403301058.37604.Antony@Soft-Solutions.co.uk>
References: <20040330093408.49895.qmail@web41410.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040330093408.49895.qmail@web41410.mail.yahoo.com>
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

On Tuesday 30 March 2004 10:34 am, V. A.H. wrote:

> Thx for your answer.
> Still a little bit confused.
> This is the scheme with ip addresses:
>
> Internet (Different ISP)
>
> Subnet Y (10.0.0.0/20)
>
> (eth0)-10.0.1.254
> Firewall
> (eth1)-10.0.1.253

I'm not surprised you are a little bit confused if these IP addresses are 
accurate :)

Please confirm: is eth0 10.0.1.254, or 10.0.0.254?

And: you have one subnet 10.0.0.0/20, with another connected network 
10.0.1.0/24 (ie a subnet of the original network)???

This is going be difficult to sort out.

Hosts in Subnet Y are going to expect 10.0.1.0/24 addresses to be local, not 
via a router - the Firewall you've shown is going to have to do a lot of 
nasty proxy-arp'ing for this setup to work.

> My Subnet(10.0.1.0/24)
>
> (eth1)-10.0.1.1(default route for My Subnet)
> Firewall/Router(SNAT)
> (eth0)-some real ip address
>
> Internet (My ISP).

I recommend you start with two non-overlapping subnets.   If you cannot do 
that, you have some significant routing challenges to solve, before you get 
anywhere near setting up netfilter to block some of the otherwise routed 
packets.

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


