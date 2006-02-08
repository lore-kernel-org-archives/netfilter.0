From: "Master" <account@netje.nl>
Subject: General NAT
Date: Wed, 8 Feb 2006 16:21:23 +0100
Message-ID: <000701c62cc3$528ac9b0$7b82a8c0@aladin>
Reply-To: account@netje.nl
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hi,
=20
I am new to IPTABLES. I have used Cisco stuff for many years, but am now =
moving to real world =E2=98=BA
=20
I need to get a DNAT/SNAT in/out working. The IN part seem to be =
working, but the route OUT seem to be the problem.
=20
Example:
On the out-side, I have address 10.10.10.40, at port 11022 (SSH) on eth1
I need to NAT this to 192.168.1.101:22 (real port) on eth2
I also need to make sure that the host is able to get out on 10.10.10.40 =
and not on the default route of route.
=20
Can anyone send me a clue on this?
=20
Regards,
   Richard


