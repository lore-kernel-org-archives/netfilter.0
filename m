From: Akolinare@gmx.net
Subject: two negatived parameters
Date: Mon, 6 Sep 2004 10:28:32 +0200 (MEST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7421.1094459312@www2.gmx.net>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

I have a little question with two negatived parameters in one rule.

I create a rule, which should only match if source and destination are not
the given. I think that it is easy and try the following rule:

iptables -A FORWARD -s ! host1 -d ! host2 -j ACCEPT

But with this rule pakets from host1 to host3 (or from host2 to host3) were
not affected. It seems like the logical combination is OR and not AND unlike
the not negatived rule.
I think that the rule is logical right. Is it a little bug or have I
misunderstood something?

I used the version 1.2.11 with kernel 2.4.26.

  Markus

--=20
NEU: Bis zu 10 GB Speicher f=FCr e-mails & Dateien!
1 GB bereits bei GMX FreeMail http://www.gmx.net/de/go/mail


