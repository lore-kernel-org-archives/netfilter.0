From: Joerg Kinzebach <jk253@duck.franken.de>
Subject: Re: MARK Locally Generated Packets
Date: Fri, 20 Jun 2003 13:08:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030620130850.A2735@pond.franken.de>
References: <20030619121130.H26250@finali.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030619121130.H26250@finali.com>; from jeno@finali.com on Thu, Jun 19, 2003 at 12:11:30PM -0600
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>      I'm trying to mark locally generated packets to be able to re-route
> HTTP(S) requets out a different gateway. Similar to a transparent proxy,
> with the exception that I want only traffic generated from this box to
> get marked and re-routed. I've setup everything correctly according to
> the many documents I've found, and I can manually use ip rules to get the
> actions I want, I'm jut not getting a mark recognized by the ip rules.

Something like this should do:

iptables -t mangle -I OUTPUT -p tcp --sport 443 -s <local_ip> \
    -j MARK --set-mark 0xc

ip rule add pref 1 fwmark 0xc table 101
ip route add 0.0.0.0/0 via $router table 101

This marks all ports originated on TCP port 443 of <local_ip> with
"0xc" and for all packets with 0xc the routing table "101" will
be used which routes everything that hits it towards $router.

I asumme you used the PREROUTING chain of the mangle table instead
of the OUTPUT chain.



joerg

