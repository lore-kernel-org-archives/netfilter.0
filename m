From: Joubert Berger <joubertb@gmail.com>
Subject: iptables-restore vs iptables-restore --noflush performance
Date: Mon, 25 Jul 2005 15:13:19 -0400
Message-ID: <63d3731e050725121353083b32@mail.gmail.com>
Reply-To: joubert@berger-family.org
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

Anyone know why I would get a big performance difference between
"iptables-restore" and "iptables-restore --noflush"?

I have 6600 rules.  If I load with iptables-restore, it takes about 30sec.
If I use noflush, that turns in 1 min and 20+ seconds.

--joubert

