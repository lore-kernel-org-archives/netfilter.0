From: "Andrew E. Mileski" <andrewm@isoar.ca>
Subject: Re: NAT and DNS/NTP servers
Date: Sat, 01 May 2004 16:48:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40940D29.3080302@isoar.ca>
References: <409310DE.2020004@isoar.ca> <200405011905.30495.Antony@Soft-Solutions.co.uk> <4093FFB3.9060502@isoar.ca> <200405012121.27461.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405012121.27461.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> 
> I do not think that netfilter will ever get "confused" about whether a reply 
> packet is in response to a locally-generated request, or a NATted connection 
> from a LAN client machine.   The gateway which you are running netfilter on 
> will always keep an accurate record of (a) locally-bound ports, and (b) 
> connection tracking table entries for packets originating elsewhere.
> 
> What makes you think that netfilter is getting anything wrong?   Are you 
> seeing packets in LOG entries which do not seem to correspond to current 
> connections?   If you are simply seeing connections not succeeding from time 
> to time, do keep in mind that this is UDP we're talking about, which although 
> is strictly known as User Datagram Protocol, can be fairly accurately 
> interpreted as Unreliable Datagram Protocol (unlike TCP, which is a reliable 
> service).

This is from a different machine (sorry), but my point is the same...

1) Make sure there are no existing entries
    # grep '123' /proc/net/ip_conntrack
    #

2) Start up a NTP server on the gateway with a poll period long enough
    to allow an entry in /proc/net/ip_conntrack to expire (I used
    minpoll 9 maxpoll 9)
    # grep '123' /proc/net/ip_conntrack
udp      17 166 src=66.11.173.24 dst=192.43.244.18 sport=123 dport=123 
src=192.43.244.18 dst=66.11.173.24 sport=123 dport=123 [ASSURED] use=1

3) Start up a NTP server on a private client with a short poll period
    (I used minpoll 4 maxpoll 4)
    # grep '123' /proc/net/ip_conntrack
udp      17 177 src=66.11.173.24 dst=192.43.244.18 sport=123 dport=123 
src=192.43.244.18 dst=66.11.173.24 sport=123 dport=123 [ASSURED] use=1
udp      17 162 src=192.168.2.244 dst=192.43.244.18 sport=123 dport=123 
src=192.43.244.18 dst=66.11.173.24 sport=123 dport=12 [ASSURED] use=1

The port was remapped to 12.  All is okay.

4) Stop the private host NTP server, keeping the gateway NTP server
    listening (long poll time remember), and make sure there are no
    existing entries (wait for any to expire)
    # grep '123' /proc/net/ip_conntrack
    #

5) Start a NTP server on a private client again with the short poll
    period
    # grep '123' /proc/net/ip_conntrack
udp      17 167 src=192.168.2.244 dst=192.43.244.18 sport=123 dport=123 
src=192.43.244.18 dst=66.11.173.24 sport=123 dport=123 [ASSURED] use=1

The port wasn't remapped... incoming packets will ALWAYS be routed
to this machine.  The NTP server process on the gateway will never
receive packets while this connecection exists.

It seems netfilter doesn't check for the existence of a local listener
on a port before deciding whether or not to remap it.  Only the
connection table seems to be referenced.

Bug or feature, I don't know.  I just wanted confirmation that this
exists.  I stated earlier that there are two ways around it.

-- 
Andrew E. Mileski

