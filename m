From: Jochen Kaechelin <fvgi242ss@wlanhacking.de>
Subject: need some assistence with vpn
Date: Sun, 5 Mar 2006 07:40:19 +0100
Message-ID: <200603050740.20121.fvgi242ss@wlanhacking.de>
Reply-To: fvgi242ss@wlanhacking.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

I have the following:

OFFICE: 
- openvpn gui
- static ip (going online with squid)
- vpn "nic" 10.8.0.6

HOME ROUTER:	
- port forwarding UDP 1604 -> SERVER UDP 1604 (192.168.178.112)
- internal ip: 192.168.178.1
- external ip: dynamic (DSL)

SERVER:
- kernel 2.6.15 (Ubuntu)
- eth0 192.168.178.112
- tun0 10.8.0.1

HOME:
- tslcient (rdp)
- eth0 192.168.178.28

I'am looking for some rules which allow a connection from
my Notebook to my Office PC.

Can someone help me?!

Thanx.

-- 
Jochen Kaechelin, fvgi242ss, wlanhacking.de
http://mail.wlanhacking.de/cgi-bin/mailman/listinfo

