From: "Brei, Matt" <mbrei@medclaiminc.com>
Subject: Multiple IP addresses
Date: Wed, 21 May 2003 19:01:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <091A6DF13847F44395B31658ED61C19C63A436@yellowstone.medclaim.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Greetings,

I'm using netfilter to nat/firewall my cable connection to my lan.  I
currently have 5 static IP addresses and would like to know if it is
possible to alias all 5 addresses on the inet_iface and then forward to
different machines on the lan_iface based on destination IP.  For
instance, there are 3 web servers on the lan say 10.1.1.1 - 10.1.1.3 and
I want all port 80/443 that comes to the netfilter machine on the
inet_address 1.2.3.4 to go to lan_address 10.1.1.1 and all port 80/443
from inet_address 4.3.2.1 to forward to 10.1.1.2 etc.  Is this possible?
If so, how about a point in the right direction.

TIA

Matt=20

