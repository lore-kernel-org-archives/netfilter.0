From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ipip tunnel connection tracking
Date: Sun, 11 Apr 2004 21:34:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404112134.40862.Antony@Soft-Solutions.co.uk>
References: <EXCFE04GjcAbeYrvKM9000011ef@smtp.e-kolay.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EXCFE04GjcAbeYrvKM9000011ef@smtp.e-kolay.net>
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
To: netfilter@lists.netfilter.org

On Sunday 11 April 2004 8:09 pm, =D6mer Ak=F6z wrote:

> I am working on connection tracking of ipip tunnel packets, while using
> ipip tunneling, in the ip_conntrack file, I see the outer src. and dst.
> addresses, I try to see original src and dst addresses.
>
> Is there any module to do this ? I see the "ip_conntrack_proto_gre", I
> think it makes this shows original addresses in gre packets ?

Why would a connection tracking module need to know about the addreses in=
side=20
the packets, rather than the addresses in the headers?

I might be wrong (I haven't used the GRE conntrack module), but I would e=
xpect=20
it to be interested in the source & destination addresses of the packets =
it's=20
handling through the machine, rather than the source & destination addres=
ses=20
of the packets inside the packets.

After all, isn't that what a tunnel is all about?   The routers along the=
 way=20
just deal with the outer addresses, not the addresses inside?

Regards,

Antony.

--=20
Most people have more than the average number of legs.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


