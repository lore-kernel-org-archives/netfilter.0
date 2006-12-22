From: Tolga Onbay <tolgaonbay@yahoo.com>
Subject: Dropping Connections
Date: Fri, 22 Dec 2006 00:30:41 -0800 (PST)
Message-ID: <20061222083041.39413.qmail@web56608.mail.re3.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,=0A=0AI want to drop all connections from/to subnet if I don't allow. Fo=
r example, accept msnmessenger protocol with l7-filter and forward all 80 c=
onnections to content filtering software. Then I want to drop all connectio=
ns. I write the rules and add the default action type to Drop. But now the =
clients cannot connect to msnmessenger. (I write the msnmessenger rule to F=
ORWARD chain) =0A=0AAlso, noone answer my previous mail, If I asked to wron=
g group or something wrong with the subject please remind me.=0A=0AThanks=
=0A=0A=0ATolga=0A=0A=0A__________________________________________________=
=0ADo You Yahoo!?=0ATired of spam?  Yahoo! Mail has the best spam protectio=
n around =0Ahttp://mail.yahoo.com 

