From: Jason Opperisano <opie@817west.com>
Subject: Re: Bizarre rule requirement
Date: Fri, 31 Dec 2004 15:40:04 -0500
Message-ID: <20041231204004.GA7810@bender.817west.com>
References: <41D5A87C.4040508@starnetworks.us>
	<20041231195406.GA7578@bender.817west.com>
	<41D5B11C.9060303@starnetworks.us>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41D5B11C.9060303@starnetworks.us>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Dec 31, 2004 at 01:05:48PM -0700, Kevin P. Fleming wrote:
> Jason Opperisano wrote:
> 
> >here's a thought:  fix your fscking application.
> 
> A working SIP ALG would be the fix for my fscking application... but so 
> far there isn't one available. What's really happening here is that the 
> far end of the "connection" is being moved to a different IP and port; 
> the local end is notified of that before it happens, but conntrack has 
> no idea it is occurring.

not free, but appears to do what you want:

  http://www.wifi.com.ar/english/voip.html

free, seems current, not sure if it meets your requirements:

  http://siproxd.sourceforge.net/index.php

i just googled for "linux sip firewall" so i assuming you're aware of
them and already ruled them out for one reason or another.

> >  # DNAT all UDP ports to 10.1.1.2 port 4000
> >  iptables -t nat -A PREROUTING -i $EXT_IF -p udp \
> >    -j DNAT --to-destination 10.1.1.2:4000
> >
> >  # accept all udp port 4000 packets to 10.1.1.2
> >  iptables -A FORWARD -i $EXT_IF -p udp -d 10.1.1.2 --dport 4000 \
> >    -j ACCEPT
> 
> Even that won't quite do it; I don't want to accept all destination UDP 
> ports to DNAT to the inside device. I want to accept all _source_ UDP 
> ports (from any IP address) as long as they are addressed to the 
> randomly-assigned outbound UDP port that my inside device got when it 
> sent out the first packet. Yeah, I know, it's screwy and funky.

explain to me how the above rules would not successfully forward the UDP
traffic to your server, because i must be missing something.  whether or
not it's how you would *like to do it* is immaterial.

-j

