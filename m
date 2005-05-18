From: Askar <askarali@gmail.com>
Subject: mangling stop working
Date: Wed, 18 May 2005 10:34:32 +0500
Message-ID: <a0f69e5050517223439804fad@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter <netfilter@lists.netfilter.org>

hi list from few days we are getting very strange problem on our
office gateway running 2.6.11.8 kernel (custom compiled)

We are using iproute2 + iptables marking feature to select different
route and to route port 80 towards our cache server which again
running linux + custom kernel.


#echo 221 cache.out >> /etc/iproute2/rt_tables
#ip rule add fwmark 1 table cache.out
#ip route add default via xxx.xxx.xxx.xx dev eth0 table cache.out
#ip route flush cache

#Mangle for Above Rule######
iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 80 -j MARK
--set-mark 1 (marking for port 80, directed towards cache server)
iptables -A PREROUTING -i eth0 -t mangle -p tcp -d xxx.xxx.xxx.xx -j
MARK --set-mark 2 (direct the traffic for our company webserver)
.
.
# then the SNAT rule

From last two days if I checked on webserver (httpd) access.log, found
that few of our LAN clients accessing web with proxy server IP, and
the rest LAN clients with gatway IP. The problem is that we have few
secure links which is restricted to be access from few IPs including
the gateway IP. So if client coming with proxy server IP they got
permission denied page.
Then I have to add the proxy server IP in "allow", however this is not
the solution thigns were working just fine from last few months its
only from two days we are getting this problem.
Yesterday I delete all the "ip rule" and rerun the firewall script,=20
things start working but later in the morning I got the call from work
that again few clients "LAN" getting the same "permission denied"

Is this a bug in iproute2 or iptables ?

Any help in this regard will be greatly appreciated.


regards

Askar Ali
--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

