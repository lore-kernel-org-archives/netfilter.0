From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: protocol 50 unreachable
Date: Fri, 3 Dec 2004 21:20:44 -0500
Message-ID: <200412032120.44988.Alistair@nerdnet.ca>
References: <Pine.LNX.4.44.0412030908140.29374-100000@gollum.grajagan.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0412030908140.29374-100000@gollum.grajagan.net>
Content-Disposition: inline
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

On December 3, 2004 12:11 pm, Helge Weissig wrote:
> ahhh... finally I see something... but what does it mean???
>
> added the following two log rules:
> $IPTABLES -A PREROUTING -t mangle -j LOG --log-level info --log-prefix 'a=
ll
> mangle preroute: ' $IPTABLES -A PREROUTING -t mangle -m conntrack --ctsta=
te
> INVALID -j LOG --log-level info --log-prefix 'contrack mangle preroute: '
>
> the second generates the following error:
> iptables v1.2.6a: Couldn't load match
> `conntrack':/lib/iptables/libipt_conntrack.so: cannot open shared object
> file: No such file or directory
=20
 The above error indicates you did not build the conntrack match module and=
=20
related iptables code.=20

>
> the ESP's however now show up in the log (these are nmap generated):

> Dec =A03 09:07:23 gollum kernel: all mangle preroute: IN=3Deth0 OUT=3D
> MAC=3D00:90:27:ca:39:56:00:10:67:00:b4:3e:08:00 SRC=3Dvpn.server.ip
> DST=3Dext.if.ip LEN=3D20 TOS=3D0x00 PREC=3D0x00 TTL=3D32 ID=3D56785 PROTO=
=3DESP
> INCOMPLETE [0 bytes]=20

> Dec =A03 09:07:23 gollum kernel: all mangle preroute:=20
> IN=3Deth0 OUT=3D MAC=3D00:90:27:ca:39:56:00:10:67:00:b4:3e:08:00
> SRC=3Dvpn.server.ip DST=3Dext.if.ip LEN=3D20 TOS=3D0x00 PREC=3D0x00 TTL=
=3D32 ID=3D7732
> PROTO=3DESP INCOMPLETE [0 bytes]
>
 It would be nice to have the other packet(s) that went out to initiate thi=
s=20
connection.  But it doesn't look good to me -- I *think* that ipt_LOG.c is=
=20
saying that the packet structure for the ESP packet is incomplete.

eh =3D skb_header_pointer(skb, iphoff+ih->ihl*4,
     sizeof(_esph), &_esph);
  if (eh =3D=3D NULL) {
   printk("INCOMPLETE [%u bytes] ",
          skb->len - iphoff - ih->ihl*4);
   break;

 Not sure how the packet is arriving in the LOG routine without the relevan=
t=20
data.


 Alistair Tonner
 RSO HP Unix admin.
=20

> h.



