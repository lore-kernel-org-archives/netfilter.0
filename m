From: "Randy Grimshaw" <rgrimsha@syr.edu>
Subject: ebtables iptables DNAT something missing
Date: Wed, 14 Dec 2005 09:43:07 -0500
Message-ID: <s39fe950.070@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

I thought I followed the recipe for DNAT on a transparent firewall =
correctly with the statement below, and sniffing shows that the traffic is =
redirected. But although the client receives the return responses from the =
server at the dnat destination - the client basically ignores it. =
(possibly as unexpected noise). What am I missing?

iptables -t nat -D PREROUTING -p tcp --dport 80 -m physdev --physdev-in =
eth1 -m mark --mark 9 -j DNAT --to-destination 192.168.12.12:80

Thank you
<><Randy


<><Randall Grimshaw
Room 203 Machinery Hall
Syracuse University
Syracuse, NY   13244
315-443-5779
rgrimsha@syr.edu

