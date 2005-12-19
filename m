From: anon ymizer <roger123@gmail.com>
Subject: Tracking incomping packets to a particular port if the original
	outbound request was to a different port?
Date: Mon, 19 Dec 2005 21:46:28 +0000
Message-ID: <d72fc30c0512191346nda31ccl@mail.gmail.com>
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

Hi,

Is there any way to track incomping packets to a particular port if
the original outbound request was to a different port (i.e AUTH back
from a FTP server after a connection request has been sent). I have
tried rules such as "iptables -A INPUT -m conntrack --ctstate RELATED
--ctproto tcp -j ACCEPT" but to no avail.
Ideally I would like to drop packets from an un-related source and
reject (or accept) packets sent from a previously initiated
connection.

R

mailto:  `echo NOrogerSP123@gmAail.Mcom | sed 's/[NOSPAM]//g'`

