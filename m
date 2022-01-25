From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [RFC PATCH 1/2] landlock: TCP network hooks implementation
Date: Tue, 25 Jan 2022 09:17:10 -0500
Message-ID: <CA+FuTSf4EjgjBCCOiu-PHJcTMia41UkTh8QJ0+qdxL_J8445EA@mail.gmail.com>
References: <20220124080215.265538-1-konstantin.meskhidze@huawei.com> <20220124080215.265538-2-konstantin.meskhidze@huawei.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K9qNYEguOKx8AbCzHGgE3pgKrH/csc5za8weZ+n8ZZg=;
        b=LS7D4KNsPJm+YayCIFnCNcWjxylNoNw76n+xa/aqD7ItWtHSu1WRHB9yIn8y3TUNPA
         dEYVHfrxQ7mzWI0eYoamdm7KWjxJQS2JrVak6Mwqcel5fZ3CS4x2AAXnjjZsRrP212CQ
         WApKf2bqXjzUdlba0CtSBhB0NgDGnChhkJMIwEif33CGe3FYZX2uK+2loylJPwHFCAfI
         +cFAVegIQ6WWXh9I5v2nwTzMdOv2f+9BrYEqmF8QMi3MFBFrYE6+TgzYs+dzxVVllnab
         /owNzn5URyT6TyiaPMPf64C6dLSPcz5PHCZlTKW9NjL/eIF5QYSfDCOyD1nY0nthq9eR
         kx5w==
In-Reply-To: <20220124080215.265538-2-konstantin.meskhidze@huawei.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Cc: mic@digikod.net, linux-security-module@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org, yusongping@huawei.com, artem.kuzin@huawei.com

On Mon, Jan 24, 2022 at 3:02 AM Konstantin Meskhidze
<konstantin.meskhidze@huawei.com> wrote:
>
> Support of socket_bind() and socket_connect() hooks.
> Current prototype can restrict binding and connecting of TCP
> types of sockets. Its just basic idea how Landlock could support
> network confinement.
>
> Changes:
> 1. Access masks array refactored into 1D one and changed
> to 32 bits. Filesystem masks occupy 16 lower bits and network
> masks reside in 16 upper bits.
> 2. Refactor API functions in ruleset.c:
>     1. Add void *object argument.
>     2. Add u16 rule_type argument.
> 3. Use two rb_trees in ruleset structure:
>     1. root_inode - for filesystem objects
>     2. root_net_port - for network port objects
>
> Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>

> +static int hook_socket_connect(struct socket *sock, struct sockaddr *address, int addrlen)
> +{
> +       short socket_type;
> +       struct sockaddr_in *sockaddr;
> +       u16 port;
> +       const struct landlock_ruleset *const dom = landlock_get_current_domain();
> +
> +       /* Check if the hook is AF_INET* socket's action */
> +       if ((address->sa_family != AF_INET) && (address->sa_family != AF_INET6))
> +               return 0;

Should this be a check on the socket family (sock->ops->family)
instead of the address family?

It is valid to pass an address with AF_UNSPEC to a PF_INET(6) socket.
And there are legitimate reasons to want to deny this. Such as passing
a connection to a unprivileged process and disallow it from disconnect
and opening a different new connection.

> +
> +       socket_type = sock->type;
> +       /* Check if it's a TCP socket */
> +       if (socket_type != SOCK_STREAM)
> +               return 0;
> +
> +       if (!dom)
> +               return 0;
> +
> +       /* Get port value in host byte order */
> +       sockaddr = (struct sockaddr_in *)address;
> +       port = ntohs(sockaddr->sin_port);
> +
> +       return check_socket_access(dom, port, LANDLOCK_ACCESS_NET_CONNECT_TCP);
> +}
