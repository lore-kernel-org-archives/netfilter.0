From: "Kerryn Wood" <Kerryn.Wood@tideway.com>
Subject: disabling conntrack ...
Date: Fri, 26 Aug 2005 13:20:58 +0100
Message-ID: <B81183566FF73947875C3A207CD60AA61DFAE4@LONEX01.tideway.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hi All,

=20

I need to disable connection tracking and, although I've seen an old
post here and a few mentions doing a search of the web, I haven't been
able to find any conclusive information.

=20

I *think* I've removed all the connection tracking modules from
/lib/modules/<kernel version>/kernel/net/ipv4/netfilter/ (I removed all
ip_conntrack* files). When I try and start iptables again I get an error
from iptables-restore. The error message is: "line 57 failed".

=20

I'm running FC3, kernel version 2.6.10-1.766 with iptables version
1.2.11.

=20

Is there a FAQ or information documented on how to do this (that's I've
missed and will be wholly embarrassed when you point it out)? Does
anyone have any experience doing this they could share?

=20

Many thanks,

Kerryn

=20

