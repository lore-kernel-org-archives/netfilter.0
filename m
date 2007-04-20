From: "Krishnamoorthy (Siva) Sivakumar" <ksivakumar@packetmotion.com>
Subject: Iptables rule on span traffic
Date: Fri, 20 Apr 2007 12:13:30 -0700
Message-ID: <E8AFFEFDBE97C94E9297963F0527A07B01DFAED8@pmi00exf00.us.packetmotion.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi

I am new to this forum and my knowledge about iptables is fairly =
limited. I did search but couldn't find an answer to my question; if =
this has been addressed elsewhere, please point me to the source.=20

Anyway, here is my situation.=20
I have fwsnort generate iptables rule (based on snort IDS rules) which =
are running on a machine with two interfaces. One of the interfaces =
(eth1) =A0is connected to a SPAN port that mirrors traffic on part of =
our network, this interface is in promiscuous mode. The other interface =
(eth0) is a regular addressable interface. For some reason, the iptables =
rules seem to have no effect on traffic seen by the SPAN port. It seems =
to work fine on traffic seen on eth0. I have tried using the -i option =
to specify the interface but that doesn't seem to help. I am trying =
simple rules like "look for string 'ssh' and LOG traffic as well as =
reject with tcp reset" to troubleshoot. =A0

Anyone have any idea what I need to do to have iptables rule to act on =
SPAN traffic. Tcpdump on eth1 does show traffic that the loaded iptables =
rules should catch. Am I missing something in the way I have set things =
up?

Thanks,
Siva

