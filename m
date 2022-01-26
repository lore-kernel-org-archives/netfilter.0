From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [RFC PATCH 1/2] landlock: TCP network hooks implementation
Date: Wed, 26 Jan 2022 09:15:34 -0500
Message-ID: <CA+FuTSc8ZAeaHWVYf-zmn6i5QLJysYGJppAEfb7tRbtho7_DKA@mail.gmail.com>
References: <20220124080215.265538-1-konstantin.meskhidze@huawei.com>
 <20220124080215.265538-2-konstantin.meskhidze@huawei.com> <CA+FuTSf4EjgjBCCOiu-PHJcTMia41UkTh8QJ0+qdxL_J8445EA@mail.gmail.com>
 <0934a27a-d167-87ea-97d2-b3ac952832ff@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=24sUfwbscwaSS1v34BS4ZqD0wKMzP9W3ynvkxLp+q7A=;
        b=gTPeTHWahFdxiWoNawVGnQRFGBASr9fBJuikPpOrLvvhH2vzZ+2+pPy8Z57VxahUAL
         8bsxCmvMj2LrgZaTqWye/dFd0NkhDIDI9rFWVU23DtW5AADN9tFyUl33P3/f/bOXpRkg
         pb4C/pmYTbSE3SSnsvAdW57nQM1zCNCqDfrfw+7fu7Vq2icotD3VMoRVqlNJcURPzr1p
         n9YcYrPLwHikLJ6ZOS4z94p/rk+iihdno/27NnfIg9Wadbjp2aJ/m2/+wCih0QLMPhua
         uVSinWvM5n1gzig7XrwbBkUEf/RzeDoQJiQB0pt2RLUpiBxO6IvHgCBoHf5kylBB/7No
         tOjg==
In-Reply-To: <0934a27a-d167-87ea-97d2-b3ac952832ff@huawei.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Cc: mic@digikod.net, linux-security-module@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org, yusongping@huawei.com, artem.kuzin@huawei.com

On Wed, Jan 26, 2022 at 3:06 AM Konstantin Meskhidze
<konstantin.meskhidze@huawei.com> wrote:
>
>
>
> 1/25/2022 5:17 PM, Willem de Bruijn =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Jan 24, 2022 at 3:02 AM Konstantin Meskhidze
> > <konstantin.meskhidze@huawei.com> wrote:
> >>
> >> Support of socket_bind() and socket_connect() hooks.
> >> Current prototype can restrict binding and connecting of TCP
> >> types of sockets. Its just basic idea how Landlock could support
> >> network confinement.
> >>
> >> Changes:
> >> 1. Access masks array refactored into 1D one and changed
> >> to 32 bits. Filesystem masks occupy 16 lower bits and network
> >> masks reside in 16 upper bits.
> >> 2. Refactor API functions in ruleset.c:
> >>      1. Add void *object argument.
> >>      2. Add u16 rule_type argument.
> >> 3. Use two rb_trees in ruleset structure:
> >>      1. root_inode - for filesystem objects
> >>      2. root_net_port - for network port objects
> >>
> >> Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
> >
> >> +static int hook_socket_connect(struct socket *sock, struct sockaddr *=
address, int addrlen)
> >> +{
> >> +       short socket_type;
> >> +       struct sockaddr_in *sockaddr;
> >> +       u16 port;
> >> +       const struct landlock_ruleset *const dom =3D landlock_get_curr=
ent_domain();
> >> +
> >> +       /* Check if the hook is AF_INET* socket's action */
> >> +       if ((address->sa_family !=3D AF_INET) && (address->sa_family !=
=3D AF_INET6))
> >> +               return 0;
> >
> > Should this be a check on the socket family (sock->ops->family)
> > instead of the address family?
>
> Actually connect() function checks address family:
>
> int __inet_stream_connect(... ,struct sockaddr *uaddr ,...) {
> ...
>         if (uaddr) {
>                 if (addr_len < sizeof(uaddr->sa_family))
>                 return -EINVAL;
>
>                 if (uaddr->sa_family =3D=3D AF_UNSPEC) {
>                         err =3D sk->sk_prot->disconnect(sk, flags);
>                         sock->state =3D err ? SS_DISCONNECTING :
>                         SS_UNCONNECTED;
>                 goto out;
>                 }
>         }
>
> ...
> }

Right. My question is: is the intent of this feature to be limited to
sockets of type AF_INET(6) or to addresses?

I would think the first. Then you also want to catch operations on
such sockets that may pass a different address family. AF_UNSPEC is
the known offender that will effect a state change on AF_INET(6)
sockets.

> >
> > It is valid to pass an address with AF_UNSPEC to a PF_INET(6) socket.
> > And there are legitimate reasons to want to deny this. Such as passing
> > a connection to a unprivileged process and disallow it from disconnect
> > and opening a different new connection.
>
> As far as I know using AF_UNSPEC to unconnect takes effect on
> UDP(DATAGRAM) sockets.
> To unconnect a UDP socket, we call connect but set the family member of
> the socket address structure (sin_family for IPv4 or sin6_family for
> IPv6) to AF_UNSPEC. It is the process of calling connect on an already
> connected UDP socket that causes the socket to become unconnected.
>
> This RFC patch just supports TCP connections. I need to check the logic
> if AF_UNSPEC provided in connenct() function for TCP(STREAM) sockets.
> Does it disconnect already established TCP connection?
>
> Thank you for noticing about this issue. Need to think through how
> to manage it with Landlock network restrictions for both TCP and UDP
> sockets.

AF_UNSPEC also disconnects TCP.

> >
> >> +
> >> +       socket_type =3D sock->type;
> >> +       /* Check if it's a TCP socket */
> >> +       if (socket_type !=3D SOCK_STREAM)
> >> +               return 0;
> >> +
> >> +       if (!dom)
> >> +               return 0;
> >> +
> >> +       /* Get port value in host byte order */
> >> +       sockaddr =3D (struct sockaddr_in *)address;
> >> +       port =3D ntohs(sockaddr->sin_port);
> >> +
> >> +       return check_socket_access(dom, port, LANDLOCK_ACCESS_NET_CONN=
ECT_TCP);
> >> +}
> > .
