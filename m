From: "Allan Gee" <AllanG@Equation.co.za>
Subject: Bridge with tunnel openvpn
Date: Tue, 22 Oct 2002 18:17:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c27a6c$a32a24e0$0eb2a8c0@equation.co.za>
Reply-To: <Allang@equation.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.samba.org

Hi Guys I would like some help on the following:
Excuse my asci-art!
                   ______     __________                      __________
______
     Web Server---|bridge|---|std router|---slow line(64k)---|std
router|---|bridge|---|LAN
                  |______|   |10.1.1.1__|                    |10.1.2.1__|
|______|
                     |
|

|10.4.0.1_______________tunnel__________________10.4.0.2__|

without the tunnel running the route for LAN is via 10.1.1.1 and route for
Web Server is via 10.1.2.1
All is fine!
Now I want the Web Server traffic to go via the tunnel end point(10.4.0.2)
so it will be compressed and encrypted but I DON't want to have to change
ANY gateway's on either the LAN devices or the Web Server.
When the tunnel comes up I thought I would use Iptables to catch traffic
going to each router and somehow redirect it to the tunnel.
I've tried to MARK packets and then send them via a rt_table but it still
goes to the default gateway on the std router. I think it's the bridging
that is messing me up but I don't no why?
My netfilter IS patched with nf-bridge etc.. I get the packets to the MARK
mangle table but they don't go to the rt_table

This is the script that runs when the tunnel comes up :

FOR Web Server side bridge:
iptables -A PREROUTING -t mangle -d 10.1.2.0/24 -j MARK --set-mark 1
ip ru add fwmark 1 table for.tun
ip ro del 10.1.2.0/24 via 10.1.2.1  #the original gateway for LAN but I keep
a static for the
						# single IP so the tunnel keeps going
ip or add 10.1.2.0/24 via dev tune table fortune
ip or flush cache
#END
in rt_tables
202 for.tun
The same mirred on the LAN bridge side!
I use OPENVPN for the tunnel!
NO GO!!
Please give me some ideas as to whats going wrong or to whether I should use
some other plan.

Regards Allan Gee
Equation
021 4181777
www.equation.co.za


