From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Limiting connections per time
Date: Tue, 27 May 2003 21:05:23 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D09@wardrive.citadelcomputer.com.au>
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
To: Alexandre Hautequest <hquest@linuxbr.com.br>, netfilter@lists.netfilter.org

Yes using patch-o-matic. there are a number of nice patches that do what =
you want..

-----Original Message-----
From: Alexandre Hautequest [mailto:hquest@linuxbr.com.br]
Sent: Tuesday, May 27, 2003 6:38 AM
To: netfilter@lists.netfilter.org
Subject: Limiting connections per time


Hello all.

First sorry if this had already replied before, but i found nothing in
ml archives. Second, sorry about my poor english.

Can i use netfilter to limit a number of connections allowed in a
per-time basis? Lets take this as an example:

I have a UDP shoutcast server. A want to limit its external access to
only one connection per IP for 30 minutes. Then i set up some rule (this
rule is what i want to know if is possible and if so, how can i do this,
what mods i need, and so on). Clients start to connect in (opens one
*session*). Another people is opening a 2nd connection (maybe behind a
NAT gw) and tries to connect in. It should block him. At the end of
time, the first *session* should be automaticaly blocked again (maybe
using my default DROP policy). A new connection can be accepted at this
time, but not as its continuation -- i mean, start another *session*.

This is what i have in mind, not actually for a shoutcast server, but is
almost this situation i have.=20

Im not subscribed, so please cc me.

Again sorry for my poor english, and thanks in advance for your time.

--
Alexandre Hautequest


