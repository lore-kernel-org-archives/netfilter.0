From: "SWAPNIL" <postmaster@modular-infotech.com>
Subject: help for iptables
Date: Thu, 21 Jul 2005 17:45:02 +0530
Message-ID: <E1A93F9B47A8452B9B3368E37904A84F@mitpl.com>
Reply-To: SWAPNIL <postmaster@modular-infotech.com>
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

Dear Sir,

Please find network.png in the link
http://downloadftp.modular-infotech.com/common/share/network.png


Router outgoing request handle by "iptables-1.2.7a-2" using following
command:
[root@gw-host8 root]# iptables -t nat -A POSTROUTING -s 192.168.1.2 -d
202.56.54.10 -j MASQUERADE

I have got a query about how to handle incoming requests for local webserver
using routers static IP address?


Thanks and regards

Swapnil K.
System Group

Modular Infotech Pvt. Ltd.
26 Electronic Co-operative Estate,
Pune Satara Road, Pune. 411 009.
Maharshtra. INDIA.
Ph: +91-20-24226612 Ext. 206.
Fax: +91-20-24225896.
E-mail: postmaster@modular-infotech.com
Website: www.modular-infotech.com


