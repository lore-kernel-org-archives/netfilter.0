From: "noa levy" <noalevy@hotmail.com>
Subject: stateful UDP with unknown source port on INPUT?
Date: Wed, 21 Mar 2007 20:30:30 +0300
Message-ID: <BAY121-F279EE21E84B52D2FA87CB1A9740@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi,
I am working on a machine that needs to send SNMP informs, and receive ACKs=
=20
for these informs. I am using iptables as my firewall, and I need to find a=
=20
way to open a pinhole for the ACK to get back to me. My problem is that SNM=
P=20
informs are sent to a predefined UDP port (162) but the ACKs are returned=20
from a random port.
The following rules exist to allow established UDP sessions:
iptables -A INPUT-p udp -m state =96state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -m state =96state NEW,ESTABLISHED -j ACCEPT

My problem is that, since the source port of the ACK is a random one, the=20
ACKs are dropped. Is there a way to allow all incoming UDP packets with an =

unknown source port and an established dest port?

Any help will be greatly appreciated,
Thanks,
Noa

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE!=20
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


