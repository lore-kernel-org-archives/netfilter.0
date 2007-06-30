From: =?koi8-r?B?8M/Qz9cg6cfP0tgg7snLz8zBxdfJ3iA=?= <igorpopov@newmail.ru>
Subject: howto make SNAT preserve translation ip for all connections from
	the same internal ip
Date: Sat, 30 Jun 2007 14:58:22 +0400
Message-ID: <20070630105822.31406.qmail@flock1.newmail.ru>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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

    Hi, all.
Say, I use iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SNAT --to-source 194.236.50.1-194.236.50.7 for NAT. Accordingly to man:
The source IP for each stream that we open would then be allocated randomly from these (194.236.50.1-194.236.50.7), and a single stream would always use the same IP address for all packets within that stream.

What if I want that internal ip from block 192.168.0.0/24 is always translated into the same external ip?
PF from OpenBSD does it:

     For nat and rdr rules, (as well as for the route-to, reply-to and dup-to
     rule options) for which there is a single redirection address which has a
     subnet mask smaller than 32 for IPv4 or 128 for IPv6 (more than one IP
     address), a variety of different methods for assigning this address can
     be used:

     bitmask
           The bitmask option applies the network portion of the redirection
           address to the address to be modified (source with nat, destination
           with rdr).

     random
           The random option selects an address at random within the defined
           block of addresses.

     source-hash
           The source-hash option uses a hash of the source address to deter-
           mine the redirection address, ensuring that the redirection address
           is always the same for a given source.  An optional key can be
           specified after this keyword either in hex or as a string; by de-
           fault pfctl(8) randomly generates a key for source-hash every time
           the ruleset is reloaded.

     round-robin
           The round-robin option loops through the redirection address(es).

           When more than one redirection address is specified, round-robin is
           the only permitted pool type.

     static-port
           With nat rules, the static-port option prevents pf(4) from modify-
           ing the source port on TCP and UDP packets.

     Additionally, the sticky-address option can be specified to help ensure
     that multiple connections from the same source are mapped to the same
     redirection address.  This option can be used with the random and round-
     robin pool options.  Note that by default these associations are de-
     stroyed as soon as there are no longer states which refer to them; in or-
     der to make the mappings last beyond the lifetime of the states, increase
     the global options with set timeout src.track.  See STATEFUL TRACKING
     OPTIONS for more ways to control the source tracking. 
   

