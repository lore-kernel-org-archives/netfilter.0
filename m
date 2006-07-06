From: Askar Ali <askarali@gmail.com>
Subject: how to by pass yahoo mail and hotmail
Date: Thu, 06 Jul 2006 17:52:59 +0500
Message-ID: <44AD07AB.7060204@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi list,

we are redirecting port 80 traffic from our firewall to our proxy/cache
servers with iptables + iproute2 ie
#ip rule add fwmark 9 table cache.out
#ip route add default via xxx.xxx.xx.xx dev eth0 table cache.out
#ip route flush cache

iptables -A PREROUTING -i eth0 -t mangle -s xxx.xxx.xx.0/24 -p tcp --dport
80 -j MARK --set-mark 9

Everythign working fine, now a question is how to -j Return yahoo mail and
hotmail traffic from going to proxy servers so that  yahoo mail and hotmail
see the orginal IP of the client not the IP of squid server.

yahoo mail and hotmail resolve to multiple IPs if I add a -J Return rule
before or after the above rule its not working say...

iptables -A PREROUTING -i eth0 -t mangle -s xxx.xxx.xx.0/24 -d
mail.yahoo.com -p tcp --dport 80 -j MARK --set-mark 9

Any help in this regards will be greatly apprecaited.

Regards,

