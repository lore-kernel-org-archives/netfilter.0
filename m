From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: RELATED emulation without ip_conntrack
Date: Wed, 23 Oct 2002 16:02:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210231602.00745.roy@karlsbakk.net>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

hi

I've got this video server streaming @ ~250Mbps, so I really don't want t=
o=20
waste cpu cycles on ip_conntrack.

how can I test for tcp flags to allow me to do a poor-man's-conntrack?

the server is only to be contacted on tcp/1234 (on that network) and will=
=20
answer from :1234 -> high port

roy
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


