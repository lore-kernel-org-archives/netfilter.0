From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [RFC PATCH 1/2] landlock: TCP network hooks implementation
Date: Mon, 31 Jan 2022 12:14:05 -0500
Message-ID: <CA+FuTSeVhLdeXokyG4x__HGJyNOwsSicLOb4NKJA-gNp59S5uA@mail.gmail.com>
References: <20220124080215.265538-1-konstantin.meskhidze@huawei.com>
 <20220124080215.265538-2-konstantin.meskhidze@huawei.com> <CA+FuTSf4EjgjBCCOiu-PHJcTMia41UkTh8QJ0+qdxL_J8445EA@mail.gmail.com>
 <0934a27a-d167-87ea-97d2-b3ac952832ff@huawei.com> <CA+FuTSc8ZAeaHWVYf-zmn6i5QLJysYGJppAEfb7tRbtho7_DKA@mail.gmail.com>
 <d84ed5b3-837a-811a-6947-e857ceba3f83@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k7+ievx6/3tS1o/ihNl/pcxCjBV2WOb0gBrhbAqg+l4=;
        b=N+o6Ve/SZZFEiuQnFtGXv0LawHh9waSUNgdpveZZS/KMyRW+IAUAVcOzaJx9mVzu6M
         92+Y3eg1ddIy7k1tGnAaO2vZpCZMVVusT8HqJvYx6WnfOA9MmFEy1GIiqz5Mhu8NypwY
         y2pd+wRKv1TaKURQxojpdKVaHoptgSEKLCUUdYT+BWDA3dzb4/kOYXe+HCACuLghaEWI
         xKWlZy4AilwPqUjKxNj7b6TAvWeTxKuY3zAoftO7LhHoo7gIXrsGQ9qcSGqhHkdfWn7q
         CDWFLLjZwLRbizLFIrIHSCTZ7pNVQJlUQ58IsdL5U3JRQ2wlJghSRfcyN8Wx/qWQ4l2y
         /IbQ==
In-Reply-To: <d84ed5b3-837a-811a-6947-e857ceba3f83@huawei.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, mic@digikod.net, linux-security-module@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org, yusongping@huawei.com, artem.kuzin@huawei.com

On Fri, Jan 28, 2022 at 10:12 PM Konstantin Meskhidze
<konstantin.meskhidze@huawei.com> wrote:
>
>
>
> 1/26/2022 5:15 PM, Willem de Bruijn =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Jan 26, 2022 at 3:06 AM Konstantin Meskhidze
> > <konstantin.meskhidze@huawei.com> wrote:
> >>
> >>
> >>
> >> 1/25/2022 5:17 PM, Willem de Bruijn =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Mon, Jan 24, 2022 at 3:02 AM Konstantin Meskhidze
> >>> <konstantin.meskhidze@huawei.com> wrote:
> >>>>
> >>>> Support of socket_bind() and socket_connect() hooks.
> >>>> Current prototype can restrict binding and connecting of TCP
> >>>> types of sockets. Its just basic idea how Landlock could support
> >>>> network confinement.
> >>>>
> >>>> Changes:
> >>>> 1. Access masks array refactored into 1D one and changed
> >>>> to 32 bits. Filesystem masks occupy 16 lower bits and network
> >>>> masks reside in 16 upper bits.
> >>>> 2. Refactor API functions in ruleset.c:
> >>>>       1. Add void *object argument.
> >>>>       2. Add u16 rule_type argument.
> >>>> 3. Use two rb_trees in ruleset structure:
> >>>>       1. root_inode - for filesystem objects
> >>>>       2. root_net_port - for network port objects
> >>>>
> >>>> Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com=
>
> >>>
> >>>> +static int hook_socket_connect(struct socket *sock, struct sockaddr=
 *address, int addrlen)
> >>>> +{
> >>>> +       short socket_type;
> >>>> +       struct sockaddr_in *sockaddr;
> >>>> +       u16 port;
> >>>> +       const struct landlock_ruleset *const dom =3D landlock_get_cu=
rrent_domain();
> >>>> +
> >>>> +       /* Check if the hook is AF_INET* socket's action */
> >>>> +       if ((address->sa_family !=3D AF_INET) && (address->sa_family=
 !=3D AF_INET6))
> >>>> +               return 0;
> >>>
> >>> Should this be a check on the socket family (sock->ops->family)
> >>> instead of the address family?
> >>
> >> Actually connect() function checks address family:
> >>
> >> int __inet_stream_connect(... ,struct sockaddr *uaddr ,...) {
> >> ...
> >>          if (uaddr) {
> >>                  if (addr_len < sizeof(uaddr->sa_family))
> >>                  return -EINVAL;
> >>
> >>                  if (uaddr->sa_family =3D=3D AF_UNSPEC) {
> >>                          err =3D sk->sk_prot->disconnect(sk, flags);
> >>                          sock->state =3D err ? SS_DISCONNECTING :
> >>                          SS_UNCONNECTED;
> >>                  goto out;
> >>                  }
> >>          }
> >>
> >> ...
> >> }
> >
> > Right. My question is: is the intent of this feature to be limited to
> > sockets of type AF_INET(6) or to addresses?
> >
> > I would think the first. Then you also want to catch operations on
> > such sockets that may pass a different address family. AF_UNSPEC is
> > the known offender that will effect a state change on AF_INET(6)
> > sockets.
>
>   The intent is to restrict INET sockets to bind/connect to some ports.
>   You can apply some number of Landlock rules with port defenition:
>         1. Rule 1 allows to connect to sockets with port X.
>         2. Rule 2 forbids to connect to socket with port Y.
>         3. Rule 3 forbids to bind a socket to address with port Z.
>
>         and so on...
> >
> >>>
> >>> It is valid to pass an address with AF_UNSPEC to a PF_INET(6) socket.
> >>> And there are legitimate reasons to want to deny this. Such as passin=
g
> >>> a connection to a unprivileged process and disallow it from disconnec=
t
> >>> and opening a different new connection.
> >>
> >> As far as I know using AF_UNSPEC to unconnect takes effect on
> >> UDP(DATAGRAM) sockets.
> >> To unconnect a UDP socket, we call connect but set the family member o=
f
> >> the socket address structure (sin_family for IPv4 or sin6_family for
> >> IPv6) to AF_UNSPEC. It is the process of calling connect on an already
> >> connected UDP socket that causes the socket to become unconnected.
> >>
> >> This RFC patch just supports TCP connections. I need to check the logi=
c
> >> if AF_UNSPEC provided in connenct() function for TCP(STREAM) sockets.
> >> Does it disconnect already established TCP connection?
> >>
> >> Thank you for noticing about this issue. Need to think through how
> >> to manage it with Landlock network restrictions for both TCP and UDP
> >> sockets.
> >
> > AF_UNSPEC also disconnects TCP.
>
> So its possible to call connect() with AF_UNSPEC and make a socket
> unconnected. If you want to establish another connection to a socket
> with port Y, and if there is a landlock rule has applied to a process
> (or container) which restricts to connect to a socket with port Y, it
> will be banned.
> Thats the basic logic.

Understood, and that works fine for connect. It would be good to also
ensure that a now-bound socket cannot call listen. Possibly for
follow-on work.
