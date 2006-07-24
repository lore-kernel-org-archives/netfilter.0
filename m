From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Internet Sharing
Date: Mon, 24 Jul 2006 09:43:38 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127D3@knowledge.wizdom.nu>
References: <6b16fb4c0607232306w3797d309u4326fb763ec92f89@mail.gmail.com>
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
To: Kaushal Shriyan <kaushalshriyan@gmail.com>, netfilter@lists.netfilter.org

In general:
=20
1. Enable ip forwarding (echo 1 > /proc/sys/net/ipv4/ip_forward)
2. Implement SNAT (or Masquerading) for your internal networks/clients =
in the POSTROUTING chain of the nat table.
3. Set up rules in the FORWARD chain of the filter table for your =
internal network/clients.
4. You can do points 1-3 easily using a tool like fwbuilder =
(www.fwbuilder.org)
=20
In detail would not be possible, as you do not specify what your =
situation is exactly.
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Kaushal Shriyan
Sent: Mon 24-Jul-06 8:06
To: netfilter@lists.netfilter.org
Subject: Internet Sharing



Hi ALL

I have my ISP connection for Internet through ADSL router. I connected
to Linux box which has FC4. I am able to browse the internel, Now how
do i share the internet to the other linux box which are in the LAN.

Thanks and Regards


Kaushal




