From: "Jeppe Frandsen" <jeppe@fralle.dk>
Subject: IP Masquerading problem with packet socket.
Date: Sun, 31 Oct 2004 10:31:36 +0100
Message-ID: <001d01c4bf2c$6d406720$0200a8c0@p9e6p78bjgt6355>
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

Hi all,

I have constructed a number of device drivers (dev1 - dev3), which is =
accessed from=20
an userspace program via a packet interface. All devices are connected =
to a bridge=20
(br0) with a static IP address 192.168.0.1/24 and a running DHCP server. =
Besides this
I have an external interface (eth0) assigned with a dynamic IP address.

Now I would like to make access from the 3 devices to the external =
interface by using=20
IP Masquerading at the same time. I found an example on the web with a =
similar setup
(see figure 7b) where eth1 and eth2 is exchanged with dev1 - dev3:

http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html#section4

I then tried to use the following configuration after the bridge was =
setup with a running=20
DHCP server, the device driver interfaces and a IP address, but without =
any luck:

iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -d 192.168.0.0/24 -j =
ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j MASQUERADE

echo '1' > /proc/sys/net/ipv4/ip_forward

I do not know if the problem is related to IP forwarding because (as I =
know) this is done
in the IP stack and hereby does not work with a AF_PACKET socket, since =
this is a direct=20
layer 2 connection between the device driver and the userspace program.=20

Thank you in advance for you help!


Best Regards,

Jeppe Frandsen,
Denmark
