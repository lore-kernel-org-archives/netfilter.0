From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Packets lost
Date: Wed, 16 May 2007 16:48:09 +0200
Message-ID: <464B19A9.700@freemail.hu>
References: <3388.10.107.26.27.1179320821.squirrel@gpo.iitb.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3388.10.107.26.27.1179320821.squirrel@gpo.iitb.ac.in>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Vasantha Kumar Puttappa <vasanthakumar@iitb.ac.in>
Cc: netfilter@lists.netfilter.org

Vasantha Kumar Puttappa =EDrta:
> Hi All,
>  Please somebody guide me here.
>
> I am tracking all udp packets (in particular, SIP based UDP packets)tha=
t
> goes through iptables using LOG mechanism.
> I use the following command,
>     iptables -A INPUT -p udp -j LOG --log-level-4.
>  =20
Maybe you also need the following rule:
iptables -A FORWARD -p udp -j LOG --log-level-4
> In addition, i also run 'Ethereal' to make sure that all the packets
> captured goes through iptables as well.
>  =20
Ethereal sees the packets BEFORE iptables.
So maybe some of your rules drops the packet.
> Here is the problem,
>   Sometimes, a random number of packets doesnot go through IPtables and=

> they are completely lost. Although, I can see those packets in Ethereal=
=2E
>
>  I tried increasing the backlog queue and ip_queue length, but still no=
 use.
>  I am using Netgear's wireless network card (WG511, made in taiwan).
>
>
>  Somebody please guide me. How do I findout the cause of this.
>
>  Regards
>  Vasanth
>  =20
Swifty


