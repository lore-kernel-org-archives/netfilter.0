From: "GG Noris" <gigi@pclinx.it>
Subject: Routing problem
Date: Wed, 13 Aug 2003 20:26:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2B82B4779E628743A7FB076FF2A721341CED81@karonte.pcx2000.local>
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

Hello.
I have a problem  in my network. i need to substitute my internet line
with 16 public ip with another line with other 16 ip.

my current functioning situation is:

1 lan 192.168.100.0/24
1 dmz	10.100.200.0/24
1 public zone 80.x.x.16/29

this 3 network are connected wit an iptables machine. fot lan i use nat
for navigate, for dmz i use port traslation to public my service in the
public zone.

all function well for 2 years.

now i need to change my public zone without loss of services.
my little brain have thinked to up another firewall box iptables and put
it with 1 nic in dmz to serve as new GW and another nic in the new
public zone. afther i public the same services with this new FW in the
new public zone. sure do not function... i have tryed but not.

in this new configuration the service from server1 smtp ( that have
always the old GW to goin out ) is functioning to the old public zone,
but when i contact the server1 smtp ftom the new public zone, my server
recive only SYN packet. but do not respond and the service smtp do not
function.

My problem is to find a solution for the migration.

my little brain.. tel me to put another nic an the old FW and use this
with 2 public zones and having only one PAT and NAT machine... is this
the solution or there is a good solution ???


THANX in adv.=20

GG

