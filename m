From: Rodrigo Hidalgo <rodde@myw0rld.org>
Subject: vrrp ip and netfilter
Date: Thu, 12 Sep 2002 11:23:53 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209121113430.11946-100000@smtp.myw0rld.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi all,

Just one question, i have a fw cluster using netfilter/iptablesv1.2.5=20
together with vrrpd.

My question is how does a packet traverse when it is destined to the=20
internal vrrp_ip? if it is destined for eth1_real_ip then it is the input=
=20
chain but that can=B4t be the case with vrrp or ?... btw vrrp_ip does=20
not show with ifconfig, so netfilter might not recognise the ip as an=20
locahost ip.=20

so:

-----Outer Net----
|
|
eth0 - <some ip>
-----FW cluster---
eth1 - <vrrp ip>=20
|
|
-----Inner net---

BR

Rodrigo Hidalgo C.



