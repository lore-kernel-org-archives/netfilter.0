From: "szpak" <xperience@interia.pl>
Subject: Load balancing.
Date: Sun, 3 Apr 2005 21:17:17 +0200
Message-ID: <004e01c53881$c1adb2d0$88161753@szpaq>
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

Hello.

I need help with I think something very easy to do with Iptables.

I need to have load balancing via nat for two or more ISP as in chart:

                           ------ ISP1
                          |          128.0.0.0/30       =20
<MY NET>---->[Linux NAT]-------- ISP2
192.168.0.0/24     |      80.0.0.0/30
                           ------ ISP3
                                   85.0.0.0/30

I have some users on my side and I want them to simply load balance =
trafic
from them via those three ISP's.  How to do that, is there a way to have =
three default static routes?

Thank You for any help it will be very usefull.

Xperience


