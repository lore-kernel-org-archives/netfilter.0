From: "Sebastien VECTEN" <svecten@aressi.fr>
Subject: Change ip_conntrack_sip default port
Date: Thu, 23 Aug 2007 15:30:07 +0000
Message-ID: <DIIE.00000AF100044B14@aressi.fr>
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

Hi,
=20
I tried to change the default port of sip_contrack and h323_conntrack in =
iptables. The problem is those conntrack are "hard compiled" in the kernel =
(not as module if not the command "modprobe ip_conntrack_sip port=3Dxxxx" =
is the solution).
=20
I would like to know if its possible to change this port (without change =
kernel) when the conntrack is "hard compiled" and especially where? (file =
or sysctl.conf etc... I didn't find)
=20
By advance thank you for your assistance.
=20
=20
.VECTEN S=E9bastien


To: netfilter@lists.netfilter.org
    netfilter-failover@lists.netfilter.org




