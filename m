From: "Kevin P. Fleming" <kpfleming@starnetworks.us>
Subject: Re: Bizarre rule requirement
Date: Fri, 31 Dec 2004 13:05:48 -0700
Message-ID: <41D5B11C.9060303@starnetworks.us>
References: <41D5A87C.4040508@starnetworks.us>
	<20041231195406.GA7578@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041231195406.GA7578@bender.817west.com>
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
To: netfilter@lists.netfilter.org

Jason Opperisano wrote:

> here's a thought:  fix your fscking application.

A working SIP ALG would be the fix for my fscking application... but so 
far there isn't one available. What's really happening here is that the 
far end of the "connection" is being moved to a different IP and port; 
the local end is notified of that before it happens, but conntrack has 
no idea it is occurring.

>   # DNAT all UDP ports to 10.1.1.2 port 4000
>   iptables -t nat -A PREROUTING -i $EXT_IF -p udp \
>     -j DNAT --to-destination 10.1.1.2:4000
> 
>   # accept all udp port 4000 packets to 10.1.1.2
>   iptables -A FORWARD -i $EXT_IF -p udp -d 10.1.1.2 --dport 4000 \
>     -j ACCEPT

Even that won't quite do it; I don't want to accept all destination UDP 
ports to DNAT to the inside device. I want to accept all _source_ UDP 
ports (from any IP address) as long as they are addressed to the 
randomly-assigned outbound UDP port that my inside device got when it 
sent out the first packet. Yeah, I know, it's screwy and funky.

If I could do it, though, it would allow me to redirect traffic around 
with aplomb, without having to wait for (or try to implement) a SIP ALG.

