From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: redirection trouble
Date: Mon, 3 Nov 2003 21:21:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311032121.09664.Alistair@nerdnet.ca>
References: <oprx3bjjmldpszyy@192.168.2.1>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <oprx3bjjmldpszyy@192.168.2.1>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?q?Mart=C3=ADn?= <martin@familia-fiumara.com.ar>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On November 3, 2003 08:53 pm, Mart=C3=ADn wrote:
> This is the situation:
>
>
>
>            Internal LAN machine (192.168.2.5)
>
>
>
> (eth1 192.168.2.1) NAT LINUX ( eth0 192.168.1.10 > adsl ppp0 IP dinamic)
>
>
>
>              Server 200.45.45.200 (service at port 10000)
>
>
>
> This is what I intend to do:
> For particular reasons, I need that a soft at 192.168.2.5 comunicate with=
 a
> server with a service at port 10000 (UDP), but this can=C2=B4t be done th=
rough
> normal NAT. So i want to establish a link between both (server and
> 192.168.2.5) manually useing the NAT LINUX
> So, 192.168.2.5 comunicates to 192.168.2.1 port 10000, the NAT LINUX
> redirect this traffic to the server 200.45.45.200 port 10000. The server
> will respond to the NAT LINUX who will redirect this traffic to 192.168.2=
=2E5
> (port 10000 also)
> I try to do all this in this way:
>
>
> iptables -t nat -I PREROUTING 1 -i eth1 -d 192.168.2.1 -p udp --dport 100=
00
> -j DNAT --to 200.45.45.200
>
> iptables -t nat -I POSTROUTING 1 -o eth0 -p udp --dport 10000 -j SNAT --to
> 192.168.2.5

	This line is SNATing the packet on the way out eth0 to 192.168.2.5 ,,,,,=20
	This NOT what you want to do ... this packet then will look like it came f=
rom=20
and went to the same ip address,

	The first line takes the packet from the source pc and DNATs it out to the=
=20
internet ip address 200.45.45.200 ... the UNDOING of this is automatic.  =20
However ... what you DO need to do is=20

iptables -t nat -I POSTROUTING 1 -o ppp0 -p udp -dport 10000 -j SNAT --to=20
(outiside ip of firewall)

  since sending the packet out the door to the internet with the source=20
address of 192.168.2.5 will cause the packet to drop dead somewhere.

   Again .. .the UNDOing of this is automatic.

>
>
> BUT THIS IS NOT WORKING. I GET A MESSAGE FROM THE SOFT AT 192.168.2.5
> TELLING "CONNECTION TIMED OUT"... USEING TCPDUMP i get this as the only
> thing comeing back...:
>
> 200.45.45.200.10000 > 168.226.174.184.10000:  udp 8 [tos 0x40]
>
>
>
> I would apreciate any help with this trouble
> Thanks

=2D-=20

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
=09
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

