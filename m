From: "Dan Jones" <Dan@AngelFireResort.com>
Subject: Errors with forwarding rules
Date: Thu, 10 Mar 2005 15:27:57 -0700
Message-ID: <DFAC9E7BBDE9424DB1B1D0754F644BC70921C0@HERMES.Inside.angelfireresort.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
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

I am trying to add a rule to forward traffic.
i.e.  -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

I get this error message when trying to load the rule

ERROR: Command "/sbin/iptables -A FORWARD -m state --state
ESTABLISHED,RELATED -j ACCEPT" Failed

I also cant use webmin to configure firewall rules for forwarding
related and established connections.
I can block traffic fine but when it comes to adding any forwarding
rules all I cant add the related and established rule.
The machine is a new install of debian 3.0, iptables 1.3.1. I have a
redhat 8 machine that these rules work great on.
Any help would be great.



Dan Jones

Angel Fire Resort
Angel Fire, NM 87710
505-377-4340
Dan@angelfireresort.com

