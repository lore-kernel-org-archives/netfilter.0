From: "Dave McCrudden" <dmccrudden@bigpond.com>
Subject: NAT performance using tlan driver
Date: Wed, 2 Oct 2002 09:44:07 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E62DA5621A6FF646BAB7B7A469FEBAEB4454@fs03.lv0.custcare.com.au>
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
To: netfilter@lists.netfilter.org

Hi All,

I know this is probably specifically related to the NIC, however I would =
appreciate any advice.

I have had some trouble getting my Compaq Netelligent Dual 10/100TX PCI =
card working well under Kernel version 2.4.19, Iptables version 1.2.7a =
(no pom). I have tried compiling iptables and the driver as modules and =
static. The machine is a Compaq Proliant 7000 with Dual P200 pro.
=20
The driver compiles, loads and appears to work fine. Performance is fine =
if I connect to the Net directly via the external interface download =
browse etc, I can also connect from another machine to the internal =
interface and transfer via ssh,samba etc and speed is fine.  The problem =
is the speed when masquerading connections using iptables, the highest =
speed I have seen is 6kb/s and it slows down from there to almost 0. I =
have tried forcing half/full duplex.
=20
I tested another Compaq card and the same thing happens.  However if I =
use 2 NE2000 compatible cards the performance is fine, well above =
500kb/s from the masq'd clients.. which makes me assume it is a tlan =
driver problem.=20

I have asked the tlan devel mail list, however I haven't seen an reply. =
I would be interested to hear any suggestions or experiences from other =
people.


Thanks
Dave

=20
=20

