From: Alexey Kurnosov <akurn@omnisp.ru>
Subject: GRE filter.
Date: Sat, 20 Mar 2004 20:48:49 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <405C8401.2060204@omnisp.ru>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


Sorry for my English.

I have Linux as VPN terminator (pptpd). Some computers in LAN should not 
have access to the server (Over GRE). So I just put:

iptables -I INPUT -s 192.168.1.1 -j DROP

And nothing.

I put:
iptables -I PREROUTING -s 192.168.1.1 -p 47 -j LOG
iptables -I PREROUTING -s 192,.168.1.1 -j LOG

and there are no messages from kernel when tunnel is up.

What wrong? Why some IP-level packets travel behind my filter?

--
Best regards.
Alex Kurnosov.



