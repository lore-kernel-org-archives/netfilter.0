From: "'Me'" <David@inspiredthinking.co.uk>
Subject: Log Problem
Date: Mon, 9 Aug 2004 18:40:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408091241665.SM01376@Hope>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

=A0Hi,
I=92m having problems logging packets (IPTables: 1.2.8 Kernel: 2.4.8) =
with the
following rule (from the  FAQ):

iptables -N logdrop
iptables -A logdrop -j LOG
iptables -A logdrop -j DROP

On the log line I get:
iptables: No chain/target/match by that name

I=92m a little lost =96 any pointers?

Regards,
David=20



