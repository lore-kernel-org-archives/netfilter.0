From: "Craig H. Anderson" <craigha@attbi.com>
Subject: First iptables script - comments please
Date: Thu, 3 Oct 2002 11:22:28 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021003172228.GC7407@gentoo.coot.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org


I've just tried iptables for the first time
and would like comments on this simiple
script.

Gateway box with
   cable modem on one NIC (eth2)
   2 NIC's connected to local hubs.
   local subnets are 10.0.0.0/24 and 10.0..1.0/24
   only 10.0.0.0 is currently in use

I am successful in getting to the internet
with this script.

# $Id: localFirewall,v 1.1 2002/10/03 16:31:21 craig Exp $
iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
iptables -A FORWARD -s 10.0.0.0/24 -j ACCEPT
iptables -A FORWARD -d 10.0.0.0/24 -j ACCEPT
iptables -A FORWARD -j DROP


