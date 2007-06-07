From: Andres Paglayan <andres@paglayan.com>
Subject: allow this specific traffic
Date: Wed, 6 Jun 2007 20:42:11 -0600
Message-ID: <EDA8F38C-C27F-47B6-B8D6-370DF9B28C8E@paglayan.com>
Mime-Version: 1.0 (Apple Message framework v752.3)
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

at my ipcop firewall, the log shows this hits:

20:38:40	 OUTPUT	eth2	UDP	172.16.1.49 1434	:::::	 192.168.51.119   1798
20:38:36	 OUTPUT	eth2	UDP	 172.16.1.49 1434	:::::	 192.168.51.119     
1797


I specifically want to allow all traffic from 172.16.1.49 from eth2   
destined to 192.168.51.0/24

what the rule should be?

Thanks,



