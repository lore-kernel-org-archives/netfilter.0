From: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Subject: binding nntp to one interface
Date: Thu, 12 Sep 2002 09:05:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20020912090056.012e6d48@linda>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi

I have two different internet connections, to two different ISP's, set up 
as load balancing.

My problem is that both my isp's have ip restricted their newsservers, so I 
need to bind all outgoing trafic on port 119 to a specific interface or ip. 
Anybody knows how to do this?

I have tried using redirect but it didn't work

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 119 -j REDIRECT --to 
<wan-ip>

and I get an error of "Invalid argument" on this SNAT rule

iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 119 -j SNAT --to <wan-ip>

hope somebody knows haw to do this.

Thanks

/Rasmus


