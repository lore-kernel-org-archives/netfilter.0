From: "Ale Zeta" <moska_buzo@hotmail.com>
Subject: Destination NAT
Date: Wed, 28 Jan 2004 17:45:04 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law11-F42BJHsxPCFj200039e0c@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Can I address an UDP packet to more than one IP address at the same time ??

I have   iptables -t nat -A PREROUTING -i eth1 -j DNAT --to 5.6.7.8-5.6.7.10 
  as an example, but I want to send the packets to both 7.8 and also 7.10 
and not doing the load balancing thing....

Is it possible to do ???


From Buenos Aires, Argentina.


Alex.-

_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*. 
http://join.msn.com/?page=features/virus


