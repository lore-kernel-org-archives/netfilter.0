From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Service names
Date: Wed, 20 Dec 2017 23:25:46 +0100
Message-ID: <20171220222546.gw3wvgyq6z2brwt7@salvia>
References: <CA+A7n+iG06Tp9oaYCWUDPsoqV=JN4BVQZHtPvxqA8ZTQhAfmqg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+A7n+iG06Tp9oaYCWUDPsoqV=JN4BVQZHtPvxqA8ZTQhAfmqg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Audet <ichimonji10@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Jeremy,

On Wed, Dec 20, 2017 at 03:18:28PM -0500, Jeremy Audet wrote:
> Apparently, ProtonMail is incapable of sending good quality plain-text
> emails. I'm sorry about that. Here's what I sent earlier, and
> hopefully gmail can do plain text right.
> 
> Hi, The nftables 0.8 release notes [1] state:
> 
> > * Replace getaddrinfo() by inet_service internal lookup table, we don't
> >   rely on /etc/services anymore, so we have a predictable input from the
> >   parser side.
> 
> Questions:
> 
> * Is there some way to view the name-to-port mappings exposed by
> inet_service, aside from digging around in source code?

# nft describe tcp dport
payload expression, datatype inet_service (internet network service) (basetype integer), 16 bits

pre-defined symbolic constants (in decimal):
        tcpmux                                             1
        echo                                               7
        discard                                            9
        systat                                            11
        daytime                                           13
        netstat                                           15
        qotd                                              17
        msp                                               18
        chargen                                           19
        ftp-data                                          20
        ftp                                               21
        ssh                                               22
        telnet                                            23
        ...

> * Is there some way to provide insert custom name-to-port mappings
> into the inet_service lookup table? Or is this a terrible, horrible,
> no-good idea?

There is not, but probably you want to define a variable for this
instead in your ruleset.
