From: "Andrew E. Mileski" <andrewm@isoar.ca>
Subject: Re: NAT and DNS/NTP servers
Date: Sat, 01 May 2004 17:42:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409419CE.5080800@isoar.ca>
References: <409310DE.2020004@isoar.ca> <200405012121.27461.Antony@Soft-Solutions.co.uk> <40940D29.3080302@isoar.ca> <200405012207.14866.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405012207.14866.Antony@Soft-Solutions.co.uk>
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
> On Saturday 01 May 2004 9:48 pm, Andrew E. Mileski wrote:
>>It seems netfilter doesn't check for the existence of a local listener
>>on a port before deciding whether or not to remap it.  Only the
>>connection table seems to be referenced.
> 
> This is correct, because remapping is only relevant to packets leaving the 
> machine (this machine acting as client), and a local listener is only 
> relevant to packets arriving at the machine (this machine acting as server).
> 
> I remain confused from your description as to whether you are talking about 
> the machine running the netfilter rules being an NTP server (servicing 
> requests from other clients), or an NTP client (sending requests to other 
> servers).

The machine running the netfilter rules is an NTP and DNS server
(servicing requests from other clients), _and_ a NTP and DNS client
(sending requests to other servers).  This is the nature of both
of these protocols (peering).

The machine running the netfilter rules is also a gateway, passing
requests from a private network to servers on the internet.

> It may be that the problem you are experiencing is simply due to the default 
> timeout on UDP "connections" (which is an artificial concept anyway, built 
> into netfilter simply to try and make UDP conform to the stateful packet 
> monitoring mechanism), and you need to adjust the timings by fiddling about 
> with /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout ?

That will work on one condition:  a guarantee can be made that the
server on the gateway will get a packet out before forwarding one
for a private host.  The gateway server must own the first entry
in the conntrack table for the port.

Otherwise the time workaround can easily be done with NTP, by setting
ip_conntrack_udp_timeout to an amount longer than the poll period of the
NTP server on the gateway.

However, with DNS one never knows when the server will go out to
the internet.  It can be quite a long time if all serviced requests
reference cached entries.

Hence my solutions (both tested) of an explicit rule to either:
  A) Force all private hosts to use the DNS/NTP servers on the gateway.
  B) Force a port remap on all DNS/NTP packets from private hosts
     passing through the gateway.

-- 
Andrew E. Mileski

