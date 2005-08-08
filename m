From: "Lotte Mygind (AH/LMD)" <lotte.mygind@ericsson.com>
Subject: Export code for Netfilter/iptables
Date: Mon, 8 Aug 2005 11:01:04 +0200
Message-ID: <388032EC32FD7A46AB01D59B3396E058B27BDB@esealmw107.eemea.ericsson.se>
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

Hello,

We are going to use Netfilter/iptables in a product. In order to obtain =
an export code, I need to document whether these components implement =
any kind of encryption - so my questions are:

* Is there any kind of encryption algorithms in Netfilter or Iptables?
* If so, what are the key lenghts used?=20
* If so, which are the algorithms?

We are using Iptables 1.3.1 and Netfilter from patch-o-matic-ng 20050626

I am well aware of the encryption in the Linux kernel - but even though =
this imposes export restrictions we have to document the encryption in =
Netfilter/Iptables.

Anyway, if anyone can help me here, I will (as a small contribution) =
write an entry for the FAQ on the issue :-)

Thanks,
Lotte

