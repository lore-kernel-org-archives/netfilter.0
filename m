From: "Bassam A. Al-Khaffaf" <bassam@palettemm.com>
Subject: How to control the bandwidth
Date: Wed, 8 Dec 2004 20:51:55 +0800
Message-ID: <MDAEMON-F200412082053.AA5333898md50000000155@palettemm.com>
Reply-To: bassam@palettemm.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

=A0
Hi All,
   I have Internet sharing Linux box (Redhat 9, Kernel 2.4.27, iptables
1.2.11). All the traffic from the LAN side is MASQUERDED to the WAN side =
so
that everyone can get access the Internet.

My backbone bandwidth is 2 mbps, when some people on the LAN side try to =
use
streaming downloads or use VoIP they will reserve the bandwidth and will
deprive the others from accessing the Internet.

How can I use the iptables firewall rules to control the bandwidth??

Regards=A0
Bassam

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.806 / Virus Database: 548 - Release Date: 12/5/2004
=20


