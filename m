From: Jason Opperisano <opie@817west.com>
Subject: Re: After 14 hours of brainpain...
Date: Mon, 03 Jan 2005 06:52:29 -0500
Message-ID: <1104753148.6489.0.camel@hubcap.ljm.dom>
References: <E6A0AAEA-5D1F-11D9-83E1-000A95B981B6@knoxville.se>
	<1104716217.6477.7.camel@hubcap.ljm.dom>
	<46D3EF59-5D62-11D9-B917-000A95B981B6@knoxville.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46D3EF59-5D62-11D9-B917-000A95B981B6@knoxville.se>
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

On Mon, 2005-01-03 at 03:34, Andreas Pettersson wrote:
> So it should look like something like this instead.. ?
> What does the -I do? and why is the order so important (just curious 
> and wants to learn).
> 
> -- CUT HERE --
> 
> iptables -t nat -A POSTROUTING -o eth1 -d ! $INET_IP -j SNAT --to 
> $INET_IP
> 
> iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS 
> --clamp-mss-to-pmtu
> 
> ## WWW Forwarding ...
> iptables -A FORWARD -i eth1 -o eth0 -p tcp -d 192.168.1.30 --dport 80 
> -j ACCEPT
> iptables -t nat -A PREROUTING -i eth1 -p tcp -d $INET_IP --dport 80 -j 
> DNAT --to 192.168.1.30:80
> 
> -- CUT HERE --

yup.

-j

--
"When will I learn? The answer to life's problems aren't at the bottom
 of a bottle, they're on TV!"
	--The Simpsons


