From: Harvey Muller <hlmuller@yahoo.com>
Subject: iptables-1.3.7 Requires ip_tables to be built as module
Date: Thu, 15 Feb 2007 10:41:16 -0800 (PST)
Message-ID: <720457.59647.qm@web53612.mail.yahoo.com>
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

Yasuyuki,=0A=0AI did not see your post until Wednesday.  I tried all the me=
thods the Gentoo devs used in their ebuild,=0Abut I still get the error, FA=
TAL: module ip_tables not found.=0A=0AI understand from your post that ipta=
bles is probably still working correctly despite the errors.=0A=0AI've only=
 begun to learn C, so much of the source I read is still unclear to me.  Bu=
t after reviewing iptables.c,=0AI believe the problem is related to functio=
n load_iptables_ko.  It is the only new addition to the code that would=0As=
eem to be creating the problem.=0A=0ABest regards,=0A=0AHarvey=0A=0A

