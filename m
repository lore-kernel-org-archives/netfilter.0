From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: How to elegantly handle two ISPs on a single box?
Date: Thu, 7 Apr 2005 23:43:26 +0200
Message-ID: <20050407214326.GD9247@torres.l21.ma.zugschlus.de>
References: <20050406171730.GA12284@torres.l21.ma.zugschlus.de>
	<bd35181c05040611517715159b@mail.gmail.com>
	<20050406193333.GD12284@torres.l21.ma.zugschlus.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050406193333.GD12284@torres.l21.ma.zugschlus.de>
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

Based on the feedback I received on this list, I chose to try the
fwmark based approach, which has shown to be surprisingly painless.

Instead of having normal SNAT rules per host in the POSTROUTING chain
of the nat table, I put fwmarks on the packets in the PREROUTING chain
of the mangle table.

Since I have a number of network routes to internal networks that are
not to be NATted, my rules look like

ip rule add pref 100 table main
ip rule add pref 200 fwmark 1 table isp_1
ip rule add pref 300 fwmark 2 table isp_2

Table main is missing the default route, which might be a pitfall if
your init mechanism goofs up. This scheme, however, allows you to keep
your normal init mechanism for the network routes which would need to
be duplicated in both ISP tables otherwise.

That way, there is no traffic leaving our network that doesn't have a
fwmark on it.

Finally, the only two NAT rules:

iptables --table nat --append POSTROUTING --match MARK --mark 1 
   --jump SNAT --out-int unt301 --to-source isp_1_ip
iptables --table nat --append POSTROUTING --match MARK --mark 2
   --jump SNAT --out-int unt302 --to-source-isp_2_ip

That way, the fwmark controls both routing and NAT.

Two pitfalls are there:
  - iptables expects the fwmark as a decimal number while ip rule
    wants to see hex
  - There is caching in place, so expecting a change to the rules to
    be effective immediately is bound for trouble.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

