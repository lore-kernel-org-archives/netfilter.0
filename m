From: "Mike" <mikeeo@msn.com>
Subject: redirection with squid
Date: Mon, 14 Apr 2003 15:59:32 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c302c0$5f07f800$8b01a8c0@win2k.com>
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

I have read the transparency How-To  and it doesn't apply to my situation. I
have a linux gateway that is also the default route for all workstations. I
also have a linux box running squid that has 2 interfaces one private and
one internet routable. So far I haven't been able to redirect my clients to
the squid box. Lay out:

        inet----linuxgateway----(private IP)
                        |
                        |
                    squid<eth1>----(privateIP)

the squid box has a routeable internet IP for eth0 and a private IP for eth1
(192.168.1.0) in fact both squid and linuxgateway have private 192.168.1.0
networks. I just need to redirect packets with destination port 80 to the
squid box so it gets proxied out. If I change my broswer proxy to squid:3128
works fine. Im thinkin policy routing maybe?

Thanks,
Mike


