From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT and broadcast
Date: Thu, 02 Sep 2004 10:31:42 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094135501.2573.30.camel@wolfpack.ljm.dom>
References: <41372A24.3020006@mrassociates.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41372A24.3020006@mrassociates.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-02 at 10:11, Ben Murphy wrote:
> I was working with DNAT and I can successfully send a traffic to another 
> machine.  The problem is that broadcast traffic is not routed.  So I added:
> iptables -t nat -A PREROUTING -p udp -d 192.168.1.255 --dport 3000 -j 
> DNAT --to-destination 172.16.17.21
> 
> This is the only rule.  But nothing is seen by the remote machine. 
> Normal traffic is routed correctly.
> 
> My guess is that even though the IP address has been changed the MAC 
> address has not and that is what is causing the packet to not be routed. 
>   Correct?  Is there a way to do this?

broadcasts are not routed, and they shouldn't be.  if you need
broadcasts to traverse a router, you need to configure a GRE tunnel. 
for the broadcast to have any meaning on the other side of the GRE
tunnel--the layer 3 network needs to be the same on both sides of the
tunnel.  a broadcast sent to 192.168.1.255 has no meaning to
172.16.17.21...

if the broadcasting host need to reach a host on another network, see if
there is a unicast option with your application (analogous to WINS for
NBNAME).

-j

-- 
Jason Opperisano <opie@817west.com>


