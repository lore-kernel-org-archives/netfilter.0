From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Temporary redirection with DNAT and SNAT
Date: Wed, 27 Apr 2005 00:00:17 -0500
Message-ID: <426F1C61.3050401@riverviewtech.net>
References: <48be50bb0504261013137f3cd2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <48be50bb0504261013137f3cd2@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kirk <whereisgui@gmail.com>
Cc: netfilter@lists.netfilter.org

Kirk wrote:
> Hello,
> 
> I have to shutdown a proxy server for a few days and I need to
> redirect its traffic to a server behind an iptables firewall. Here's
> what I want to do:
> 
> Original request to $PUBLIC_IP:80 is redirected  to $PRIVATE_IP:2050
> (machine behind firewall)
> 
> Packets from $PRIVATE_IP:2050 come out of the firewall as coming from
> $PUBLIC_IP:80
> 
> I binded the proxy's public IP to the firewall's  external interface
> (eth0) and added the following rules:
> 
> I think I got the first part right.
> #test for ezproxy
> -A FORWARD -i eth0 -o eth1 -p tcp --syn -d 192.168.0.3 --dport 2050 -j ACCEPT

Do you have any other rules in your FORWARD chain that will allow the rest of the traffic flow through to the Proxy, i.e. --state ESTABLISHED?  Correspondingly do you have any rules that will prevent the traffic that is flowing from the proxy in eth1 and back out eth0?  This could get you down the road.

> But I'm having problems with the second part. The SNAT rule:
> -I POSTROUTING -s 192.168.0.3 --sport 2050  -o eth0 -j SNAT --to 130.17.174.108

You will have to specify a protocol "-p tcp" to use any port definitions.

> #This one seems OK too.
> -A PREROUTING -i eth0 -p tcp -d $PUBLIC_IP --dport  80 -j DNAT --to
> $PRIVATE_IP:2050
> 
> The SNAT rule generates the error:
> Applying iptables firewall rules: iptables-restore v1.2.11: Unknown
> arg `--sport'

*nod* see above.

> One of the restrictions I have is that *only* the packets from
> $PRIVATE_IP:2050 can go out as coming from $PUBLIC_IP:80.

If you are really paranoid that this will happen you could write a rule that would drop any traffic that was not from the internal proxy.

-A FORWARD -s ! 192.168.0.3 -p tcp --sport 80 -j DROP



Grant. . . .

