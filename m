From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: iptable_nat and Linksys VPN box?
Date: Wed, 3 Sep 2003 10:32:58 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309031014150.1440@simba.math.ucla.edu>
References: <3F55FD19.7080804@palaver.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F55FD19.7080804@palaver.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Capouch <brianc@palaver.net>
Cc: netfilter@lists.netfilter.org

On Wed, 3 Sep 2003, Brian Capouch wrote:
> I have a new client who has a Linksys NAT appliance in his office, and
> he claims he needs "public IP on the interface and public IP to the
> router" in order to make it work.

He may not be using FreeS/WAN, but it trips over all the relevant issues,
and it's free, and it works.  So you could use that for your own
experimentation.

Some VPN products (e.g. Cisco VPN-5000) can work through a NAT box, and
some can't, including FreeS/WAN.  The key management daemon on each end
expects to be able to send to port 500 of the other partner, and to hell
with this fancy NAT stuff, specifically the way port numbers are
rearranged.  There's a RFC out about NAT traversal (Nat-T) and a patch for
FreeS/WAN that's supposed to implement it, but I got distracted before
being able to give it a good test.

Another problem is that FreeS/WAN sometimes identifies connections by the
IP address of the remote end, which therefore has to be unique.  The README
for Nat-T says that you really should be using something else to identify
connections, like X.509 certificates.

Finally, if the remote IP is not unique, there will be multiple tunnel
devices to which returning packets might be sent, and by Murphy's law, the
wrong one will be picked.  This problem applies to a variety of tunnel
schemes.

Can anyone on the netfilter list suggest how to guarantee that returning
packets in a connection go to the interface from which the connection
originated, even in case of non-unique IP addresses like the very commonly
used 192.168.0.1?  In other words, several tunnel devices have host routes
with 192.168.0.1 on the remote end, and all of them initiate connections,
and you're supposed to keep traffic from all being sent to the first
tunnel.  I've figured out something really kludgey with the connmark and
ROUTE extension targets, but this only works if preconfigured, i.e. the
number of tunnels cannot grow (and shrink) dynamically.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

