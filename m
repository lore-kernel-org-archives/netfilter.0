From: Jason Opperisano <opie@817west.com>
Subject: Re: netfilter dnat or proxy arp needed
Date: Wed, 08 Dec 2004 18:48:51 -0500
Message-ID: <1102549731.3472.64.camel@hubcap.ljm.dom>
References: <web-8752702@mailstore.fernuni-hagen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-8752702@mailstore.fernuni-hagen.de>
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
Cc: Andreas Nobel <Andreas.Nobel@FernUni-Hagen.de>

On Wed, 2004-12-08 at 10:13, Andreas Nobel wrote:
> Hi Jason.

hello.

> I have read your post on the netfilter ml:
> 
> https://lists.netfilter.org/pipermail/netfilter/2004-October/056465.html

ah--one of my saucy rants over semantics...  speaking of which:

"Now, I don't want to get off on a rant here..." but since you seemed to
see some benefit in searching the list archives, why would you see fit
to deny others the same benefit?  oh--and i sanitized your IP's out in
case that was the reason...

> I want to setup the following senario. Can you give me an 
> detailed instrction guide or syntax how to make this 
> translations work.
> 
> first of all i will describe my network struture which 
> goal it is to make it work in real environment.
> 
> The user should be able to connect to an access point that 
> will offer the client an adress from an dhcp server on the 
> network. the vpn gateway is 192.168.0.1 the dhcp server 
> allocate leases from hosts 10-50. so that the clients will 
> get an ip adress of the same subnet private class c subnet 
> (192.168.0.0/24)as the vpn gateway is. the vpn gateway has 
> two independent (physical) network cards. one on the 
> private class c network to reach the wireless clients 
> anothe ron on the company intranet. the company intranet 
> ip adresses are real world wan ip's which can be directly 
> used for internet purposes. the second nic has ip 
> 1.1.1.74/24 and its route to other networks is 
> 1.1.1.254. so the clients should get an ip adress 
> from this adress pool so that they are able to connect to 
> the company subnet resourses and also the whole internet 
> Trough 1.1.1.254 router). this is also the standard 
> gateway from my linux box to reach the intranet/internet.
> 
> i have included an attachment of the sitation. maybe its a 
> better way to show up what i want to do.

um--sure:

  for i in `seq 10 50`; do
    # outbound SNAT for each DHCP client 10-50
    iptables -t nat -A POSTROUTING -o eth1 -s 192.168.0.${i} \
      -j SNAT --to-source 1.1.1.${i}

    # inbound DNAT for each DHCP client 10-50
    iptables -t nat -A PREROUTING -i eth1 -d 1.1.1.${i} \
      -j DNAT --to-destination 192.168.0.${i}

    # add ip alias on external interface for each NAT IP
    ip address add 1.1.1.${i} dev eth1
  done

add filter rules as suitable

-j

--
"This has purple stuff inside - purple is a fruit."
	--The Simpsons


