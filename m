From: Jason Opperisano <opie@817west.com>
Subject: Re: l7 -> drop & ip_conntrack entries
Date: Sat, 11 Sep 2004 18:15:50 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094940949.3925.11.camel@wolfpack.ljm.dom>
References: <4142E948.8080300@uplink-verein.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4142E948.8080300@uplink-verein.ch>
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

On Sat, 2004-09-11 at 08:02, Moritz Gartenmeister wrote:
> Why are there still connections tracked, although i drop the packets
> with iptables in prerouting mangle?
> iptables recognizes this connections as bittorrent, why are they not
> droped? Why do they get a ASSURED and ESTABLISHED connection?
> And BTW: does this mean, that there is actually bittorrent traffic?
> And i rebooted my system, checked the /proc/net/ip_conntrack (didn't
> exist), set up the bridge, set up iptables, pluged in the ethernetcables.
> 
> thanks for some light...
> moritz

this really depends on the internals of l7filter, and what "DROP" means
to it.  if you think about what's going on--the behavior you're
observing makes sense:

client sends SYN to server:bittorrent_port
  -> firewall accepts this packet
server sends SYN-ACK
  -> firewall accepts this packet
client sends ACK
  -> firewall accepts this packet

at this point you have a fully-established (assured) TCP connection--so
it gets entered into ip_conntrack.

now client and server exchange some data packets, one of which triggers
your l7filter module match, so that packet gets dropped...which will
effectively break/block the client and server's ability to communicate;
however--unless l7filter goes in and removes the conntrack entry (which
i *highly* doubt that it does)--the conntrack entry will be left to hang
around until it times out.

this (amongst other reasons) is why i prefer to use a true app-level
gateway to scrub this stuff out.

-j

-- 
Jason Opperisano <opie@817west.com>


