From: "Mike" <mikeeo@msn.com>
Subject: problem with 1:1 NAT BUG? or user error?
Date: Thu, 30 Jan 2003 08:59:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c2c867$de96b2c0$3101a8c0@win2k.com>
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
To: netfilter@lists.netfilter.org

I have been trying to get 1:1 NAT working like with a Cisco PIX  and for the
most part I use the following rules and it works..but for only a few a hours
then stops.

iptables -t nat -A PREROUTING -p tcp -d 146.145.134.194 --dport 80 -j
DNAT --to 192.168.1.197
iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.97 -j SNAT --to
146.145.134.194

So it works for a few hours then stops, but I can get it working again by
aliasing an interface i.e ifconfig eth0:1 146.145.134.194 bcast and netmask
etc..
And instantly it starts working again. Anyone know what my problem is?
Thanks to all those who helped me out.


-Mike


