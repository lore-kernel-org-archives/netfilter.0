From: "William Olbrys" <william_olbrys@student.uml.edu>
Subject: Static NAT
Date: Thu, 13 Feb 2003 08:04:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <30cd12e6eb.2e6eb30cd1@student.uml.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Language: en
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello
   I'm trying to set up my an internal network connected to a hub with
an uplink to a redhat 8 box running iptables.  Each internal box would
have an internal ip, but i'm trying to get dnat and snat to change the
packets' IPs to available static addresses on my network. This way i
could have a nice firewall in place and take advantage of some other
services for these internal. I've been trying to do this for a couple of
days but with little luck. I know i set up the rest of the tables
correctly though because if I use MASQUERADE it works instantly, but i
need those IPs! :)
Here is a sample of my DNAT/SNAT entries for one machine.

echo -n "setting nat rules"
$IPTABLES -t nat -A PREROUTING -s 0.0.0.0/0 -d 129.63.106.11 -j DNAT
--to-destination 192.168.2.2
$IPTABLES -t nat -A POSTROUTING -s 192.168.2.2 -d 0.0.0.0/0 -j SNAT
--to-source 129.63.106.11
echo " Done"

is this really possible?



 E2-O: The presence of this footer indicates the message has been scanned for viruses by the WebShield e500.



