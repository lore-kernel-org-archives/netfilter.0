From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Loose source routed IP packets.
Date: Tue, 23 Sep 2003 09:22:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F704912.6010800@chrisbrenton.org>
References: <200309231347.57709.carles@unlimitedmail.org>	 <Pine.LNX.4.51.0309231409290.14794@dns.toxicfilms.tv> <1064320275.31340.104.camel@raylinux.internal>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Ray Leach wrote:
> 
> How about :
> ### don't accept source routed packets
> /bin/echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route

I keep meaning to do some testing with this but have not had the 
bandwidth. Just wondering if anyone else actually has.

I would expect the above would work fine with strict source routing, but 
I'm not so sure about loose source routing unless the firewall was one 
of the defined jump points.

For example, let's say I know you "trust" some IP address on the 
Internet and permit a greater level of access from it to one of your 
internal systems. I craft the following packet:

source IP = mine
Dest IP = "trusted" Internet host
First byte of IP options = 83
IP in options field = your internal server

In this case none of the IPs are the firewalls so I'm not so sure 
accept_source_route would even be referenced. Does the kernel check the 
size of all IP headers and process the included options even if its not 
the destination IP? I would think it would not for efficiency, but then 
again it might to deal with things like option 7 (record route).

Has anyone tested this either way?

Thanks in advance!
Chris


