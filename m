From: Norman Zhang <norman.zhang@rd.arkonnetworks.com>
Subject: Multiple Netmeeting Sessions
Date: Sun, 25 Apr 2004 09:07:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <408BE248.4030302@rd.arkonnetworks.com>
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

Hi,

I was wondering if it is possible to setup iptables to allow multiple 
Netmeeting sessions originated from internet to local net? So far I map 
the port in /etc/shorewall/rules

DNAT net loc:10.0.0.10 tcp 1720
DNAT net loc:10.0.0.10 tcp 1503

But it only goes to a single machine? Or do I need gateway for this?

Regards,
Norman

