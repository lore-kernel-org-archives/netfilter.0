From: Jason Opperisano <opie@817west.com>
Subject: Re: A secure router, by MAC address
Date: Wed, 20 Oct 2004 16:39:53 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041020203953.GA7940@bender.817west.com>
References: <1098297965.5686.9.camel@6-allhosts>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1098297965.5686.9.camel@6-allhosts>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Oct 20, 2004 at 12:46:06PM -0600, jgalvez@webpipe.net wrote:
> I am trying to setup a router, that forwards traffic from one interface
> for only a specific set of MAC addresses.
> 
> Users on eth1 side will use a static IP address with a known MAC
> address. DHCP will be running on eth1 for rogue users. If the source IP
> is 10.0.0.0/8 all port 80 traffic needs to be redirected to localhost
> port 80. ONLY traffic from a listed IP and MAC should be allowed to be
> forwarded out.

# create new chain to mark known MAC/IP pairs
iptables -t mangle -N mark_known_hosts

# go to that chain first
iptables -t mangle -A PREROUTING -i eth1 -j mark_known_hosts

# mark known MAC/IP pairs
iptables -t mangle -A mark_known_hosts -m mac --mac-source XX:XX:XX:XX:XX:XX \
  -s w.x.y.z -j MARK --set-mark 1

# redirect unmarked 10.0.0.0/8 port 80 traffic to localhost
iptables -t nat -A PREROUTING -i eth1 -p tcp --syn -s 10.0.0.0/8 \
  --dport 80 -m mark ! --mark 1 -j REDIRECT --to-port 80

# allow unmarked 10.0.0.0/8 port 80 traffic to localhost
iptables -A INPUT -i eth1 -p tcp --syn -s 10.0.0.0/8 \
  --dport 80 -m mark ! --mark 1 -j ACCEPT

# allow marked traffic to be forwarded out
iptables -A FORWARD -i eth1 -m mark --mark 1 -j ACCEPT

this example only points out the general concept--this is (obviously)
not a complete firewall ruleset--but should point you in one of many
"right" directions.

-j

-- 
Jason Opperisano <opie@817west.com>

