From: "Gessler Gerhard" <Gessler@iabg.de>
Subject: AW: how to build a routing/packet filtering experimental environment on single PC
Date: Wed, 30 Jun 2004 14:21:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <69A5E767EC979846826F566C7932A3F21335E6@exchange03.iabg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Li Xinyi <xinyeeli@hotmail.com>, netfilter@lists.netfilter.org

You might want to take look at UML (User Mode Linux). I know that for =
example the OpenSWAN team uses it to test their IPsec implementation on =
a single PC. They setup 4 UML instances for 4 virtual PCs and connect =
them via=20
uml_netjig ( if I am not wrong). More details can be found at =
http://wiki.openswan.org/index.php/UMLTesting.
=20
Hope this helps,
=20
    Gerhard

________________________________

Von: netfilter-admin@lists.netfilter.org im Auftrag von Li Xinyi
Gesendet: Di 29.06.2004 17:43
An: netfilter@lists.netfilter.org
Betreff: how to build a routing/packet filtering experimental =
environment on single PC



Hi, there

I started to learn iptables a few weeks ago. I am stuck at moment =
because I
dont have many machines to play with. I am wondering is there any tools,
which can be used to build a virtual envionment to play with routing and
packet filtering on sinple machine. Tools like VMware would not be my
choice because I only have 1GHz PIII with 256M memory.

Best Regards,
Christopher Li

_________________________________________________________________
??????????????- MSN Hotmail?  http://www.hotmail.com=20





