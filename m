From: Francis GASCHET <fg@numlog.fr>
Subject: Filtering PPP traffic
Date: Thu, 17 Apr 2003 19:53:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E9EEA10.9050306@numlog.fr>
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

Hi list,

Is there somebody who knows a possibility to apply netfilter rules to 
ppp packets ?

Configuration :

DSL - PCI modem card - BRIDGE - eth0 (in a virtual machine)

I would like to filter the traffic which flows across the bridge, but at 
this level, the IP traffic is encapsulated...

Any clue ?

Ciao.

-- 
Francis GASCHET / NUMLOG
http://www.numlog.fr
Tel.: +33 (0) 130 791 616
Fax.: +33 (0) 130 819 286





