From: eugene@alohanet.com (Eugene Portnoy)
Subject: transparent proxy -- two userspace processes problem
Date: Thu, 17 Jul 2003 23:29:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007101c34cf5$f8ec4c80$69e9a8c0@EUGENE>
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

I'm trying to combine two userspace applications on a single 2.4 kernel
machine. One of the applications is actually well known squid, another one
is not-so-well-known TCP proxy. I need the wan output of squid to be picked
up by this second proxy which is implemented using TUN/TAP driver.

By itself, both of the proxies work. Squid by usual "REDIRECT -- to-ports
3128" clause and the other using FMARK, corresponding ip rules and virtual
interfaces.

So, it looks like this

TCP
(LAN) eth0 <--> tun0 <--> TCP proxy <--> tun1 <-->eth1 (WAN)

or

HTTP
(LAN) eth0 <--> Squid <-->eth1 (WAN)

I'd imagine something like this

HTTP eth0 <--> Squid
                           /\
                            |
                           V
TCP   eth0 <--> tun0 <--> TCP proxy <--> tun1 <-->eth1

I'm trying to do this without modifying the code of any of the applications,
but rather using iptables/iproute2. It it possible?

If something is not clear, please do not hesitate to ask.

Thanks in advance,
Eugene.


