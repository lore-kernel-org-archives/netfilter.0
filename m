From: "Thhoep" <thhoep@gmx.de>
Subject: Re: Iproute2 and fwmark usage
Date: Fri, 9 Jan 2004 22:30:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006501c3d6f7$d96ecf90$1684188d@Kiste>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <20040109164718.GB24304@cannon.eng.us.uu.net> <001d01c3d6cc$191fc210$1684188d@Kiste> <20040109173530.GC24304@cannon.eng.us.uu.net> <001601c3d6d0$b8198e10$1684188d@Kiste> <20040109194247.GD24304@cannon.eng.us.uu.net> <001101c3d6e3$cdf03e60$1684188d@Kiste> <20040109204745.GE24304@cannon.eng.us.uu.net> <004101c3d6ec$7801b6b0$1684188d@Kiste> <20040109212241.GF24304@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

i just tried over an hour to bring a tunnel up on one of my other servers,
so i can simulate routing behaviour with it, but just wasted my time with
trying to fix a broken ppp installation on it. dont have the patience and
gotten way too tired to do that right now. so i give you the configuration
of my testing setup and if you would like to reproduce it i would appreciate
it.

iptables -t mangle -A PREROUTING -i eth4 -s 192.168.0.22 -j MARK --set-mark
0

ip route add 192.168.0.0/24 dev eth4 table test

ip rule add fwmark 1 table test
OR
ip rule add from 192.168.0.22 table test

(these ones done in the ppp ip-up script)

ip route add <remote ip> dev <ppp iface> src <local ip>
ip route add default via <remote ip> dev <ppp iface>

(dont use a default route in the main table to the same ppp iface, so you
feel a difference when the routing rules apply or not)


thats all i think.


