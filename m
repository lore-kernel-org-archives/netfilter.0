From: Harvey Muller <hlmuller@yahoo.com>
Subject: iptables-1.3.7 Requires ip_tables to be built as module
Date: Mon, 12 Feb 2007 11:49:12 -0800 (PST)
Message-ID: <936822.57379.qm@web53605.mail.yahoo.com>
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

Graham,=0A=0AAssuming you've built ip_tables into the kernel (not as a modu=
le), then I'd be interested in learning the difference in the process you u=
sed to install iptables between versions 1.3.5 and 1.3.7.  Version 1.3.5 wo=
rks fine for me with kernel version 2.6.20 built in (not as a module).  But=
 when I use the same install process for 1.3.7, I get the error messages.  =
And when I go back and configure ip_tables as a module, then the error mess=
age goes away, which is what one would expect.=0A=0AThanks,=0A=0AHarvey=0A=
=0A

