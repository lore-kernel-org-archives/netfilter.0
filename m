From: Jason Opperisano <opie@817west.com>
Subject: Re: Port forwarding
Date: Thu, 28 Oct 2004 08:50:10 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098967809.3029.10.camel@hubcap.ljm.dom>
References: <1098937823.3566.15.camel@WS4>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1098937823.3566.15.camel@WS4>
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

On Thu, 2004-10-28 at 00:30, Mike wrote:
> Hi All
> 
> I bet this has been asked many times before but I have searched and
> searched trying to find the answer.
> 
> Is it possible to port forward one port from the outside world to many
> clients inside the LAN. I have it working fine for single addresses and
> it seems I can list each IP forward individually so that
> narc-forward.conf ends up huge as each line goes in for each IP address
> on the network with the same port.
> 
> The question basically is to find out if there is anyway that a range of
> IP addresses can be stipulated easily in narc-forward.conf???
> 
> Mike

no.  the quad of:

src_ip:src_port,dst_ip:dst_port

is unique.

once you create a rule that says "translate packets from any IP address
destined for 1.2.3.4:80 to 5.6.7.8:80" no other rule that tries to map
1.2.3.4:80 will match.

this is not a limitation of netfilter--just a fact of life.

you either need (a) more public IP's, or (b) some sort of
application-level proxy that can redirect the traffic to multiple hosts
based on the application-level data.

in the case of HTTP, you could use squid or apache+mod_rewrite to take a
single and redirect to multiple servers based on host-header
redirection, or full URL rewriting.

-j

-- 
Jason Opperisano <opie@817west.com>


