From: "Scott Knake" <sknake@Apexsoftware.com>
Subject: RE: iptables and wireless card in promiscuous mode
Date: Wed, 1 Dec 2004 15:45:32 -0500
Message-ID: <424BCB4EA242A1429A8AF0548E8CFF0E12399C@apexexchange.ApexSoftware.Com>
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

>> Can anyone tell me how to set up a simple filter using BPF that
blocks
>> all the packets coming from a given MAC address?

>Out of curiosity what is this BPF you speak of? I googled for it and I
>came across "Berkeley Packet Filter" which sounds about on topic with
this
>mailing list but it seems to be a FreeBSD util.  I did an slocate for
it
>on my box and it found nothing but a header file.  Is this some
>non-standard util has a linux port for link layer filtering?

/usr/src/linux/Documentation/Configure.help (2.4.28)

Packet socket
CONFIG_PACKET
  The Packet protocol is used by applications which communicate
  directly with network devices without an intermediate network
  protocol implemented in the kernel, e.g. tcpdump.  If you want them
  to work, choose Y.

  This driver is also available as a module called af_packet.o ( =3D
  code which can be inserted in and removed from the running kernel
  whenever you want).  If you want to compile it as a module, say M
  here and read <file:Documentation/modules.txt>; if you use modprobe
  or kmod, you may also want to add "alias net-pf-17 af_packet" to
  /etc/modules.conf.

  If unsure, say Y.


man tcpdump. More or less the linux equivelant.



