From: aksingh@hss.hns.com
Subject: Re: incoming interface confusion question
Date: Tue, 22 Jun 2004 16:26:04 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF40F5C630.7269BB1F-ON65256EBB.003B693D@hss.hns.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Cc: netfilter@lists.netfilter.org





Hi,

   I am trying to spoof a TCP connection, I do a telnet from machine A =
to
machine B and then catch a packet in between and thn try and send a res=
et
to machine A, by generating the TCP packet myself, the packet going out=

from machine A are caught on machine A itself. To make this work I need=
 to
call netif_rx with an skb I allocate, but when I do this, the TCP socke=
t on
machine A does not get the packet, I suspect it is being dropped by
netif_rx(), what all does one have to make sure to be sure that netif_r=
x()
hands the packet to ip and packet is not dropped (besides checksum and
all).
I looked at netif_rx, I have to set the incoming interface device  here=
. So
what I do is, I copy the incoming interface device structure of the fir=
st
packet I catch in the pre rotuing hook and and give that as the incomin=
g
device in the skbuff containing the RST, is that ok ? or what kind of h=
ack
do I need. If someone has tried this earlier, would appreciate if u giv=
e me
some pointers.

thanks
Amit




Ranjeet Shetye <ranjeet.shetye2@zultys.com>@lists.netfilter.org on
06/22/2004 02:04:36 AM

Sent by:    netfilter-admin@lists.netfilter.org


To:    netfilter@lists.netfilter.org
cc:

Subject:    Re: incoming interface confusion question


* Cedric Blancher (blancher@cartel-securite.fr) wrote:
> Le lun 21/06/2004 =E0 19:45, Shaun T. Erickson a =E9crit :
> > Are there any cases where iptables can be confused about what inter=
face
> > a packet came in on? Can a packet arriving on interface A ever be
> > reported as arriving on interface B?
>
> I'm not aware of such a case. Would be quite surprising.
>
> > I had an incident this weekend, and am trying to be certain that th=
e
> > packets came in the interface my system said it did. It's a Red Hat=
 9
> > system, running their stock 2.4.20-8 kernel.
>
> Do you have any reason to think your system was wrong ?
>

In order of likelihood, (highest to lowest):

1) http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.kernel.rpf.html

Check your /proc/sys/net/ipv4/conf/$INTF/rp_filter setting.

If it is not set, someone might have tried to attack your network from
the public side, using private src ips. e.g. this can be used for an
attack to make javaVM think that the packets are coming from the host
itself or a trusted server.

2) If it is set, then a VPN might still allow such packets into your
network, past a firewall.

3) If neither, then it might be an issue with the code in Linux.

HTH

--
Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye at Zultys dot com
http://www.zultys.com/

The views, opinions, and judgements expressed in this message are solel=
y
those of
the author. The message contents have not been reviewed or approved by
Zultys.


=



