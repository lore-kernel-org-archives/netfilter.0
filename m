From: =?UTF-8?Q?St=C3=A9phane_Charette?= <stephanecharette@gmail.com>
Subject: Re: netfilter queues only seeing IPv4/TCP traffic
Date: Fri, 16 Jan 2015 22:14:03 -0800
Message-ID: <CA+HxBUJsusuAWPEpbxjZQdGo31yZtsU+6nrGJ6GO-H9YeLMswQ@mail.gmail.com>
References: <CA+HxBU+RUU7NCTx3W1KeWaC-iDWs+JdicqmbVGmgDH4v7mENyA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=U1KmiD/5/ENR256BDld17a1jpmxFbfuXPYxsSGfTHNs=;
        b=JpZrWcYNQ4G14ortQf0w8NqMrsctRauohMsjdYsyxSPKnmaEkBw+h01CVsZSVF2HwV
         MRy6lEuv8frsHYqmUSpHqIA/epzs2vjh6Una4pRRSsqMqW2NPmsqG8QLaj3VHcgLY3ZP
         M+DP7qRvq7NfzUKbLgZvtnCLlRDxEgWszNaNY8GJGPwYMGTIuBCkb4PE2cTO8Q3s5Gei
         rXDDmRCkobehqV+pJC6iuOSm5wXQfNdJVf/a+xkgEz0073NdW0oEy8+CQGRq/rGgb5zj
         kVGEFP8XqX5d7RI2lIETFZ8JAX4jrCosxHvyj06fh5I10iKP0k+VPemiIEi7VaihGL6U
         KemA==
In-Reply-To: <CA+HxBU+RUU7NCTx3W1KeWaC-iDWs+JdicqmbVGmgDH4v7mENyA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

On Fri, Jan 16, 2015 at 10:04 PM, St=C3=A9phane Charette
<stephanecharette@gmail.com> wrote:
> I have netfilter queues setup more-or-less like the Doxygen pages des=
cribe:
>
> nfq_open();
> // nfq_bind_pf( h, AF_INET ); -- commented out
> nfq_create_queue( ... );
> nfq_set_mode( q, NFQNL_COPY_PACKET, 0xffff );
> nfq_fd( h );
> ...read from fd...
> nfq_handle_packet( h, buffer, bytes_read );
>
> And my callback is doing a hex dump of the payload and calling
> nfq_set_verdict(...);
>
> All is well, but I'm only seeing IPv4+TCP packets.  I have a few
> related questions:
>
> 1) Is there another API I must call to see all traffic?
> 2) ...or are my iptable rules the likely culprit?
> 3) Some web pages say nfq_bind_pf() is ignored, is that true?
>
> The rules I'm currently using to get traffic to flow to my queues:
>
> iptables --table filter --new-chain MYQ
> iptables --table filter --append MYQ --jump NFQUEUE \
>     --queue-balance 0:3 --queue-bypass
>
> iptables --table nat --append POSTROUTING \
>     --source 10.0.1.0/24 --out-interface eth0 \
>     --jump MASQUERADE
>
> iptables --table filter --append FORWARD --jump MYQ
>
> I had more elaborate rules, but I simplified it to these for testing.
> I'm just trying to get all traffic forwarded by this device to go
> through the netfilter queues.
>
> Thanks for any pointers.
>


I probably should have included version numbers of what I'm using:

> dpkg -l | egrep "iptables|netfilter|linux-generic"
ii  iptables                              1.4.21-2ubuntu1
ii  libnetfilter-conntrack3:amd64         1.0.4-1
ii  libnetfilter-queue-dev                1.0.2-2
ii  libnetfilter-queue1                   1.0.2-2
ii  libxtables10                          1.4.21-2ubuntu1
ii  linux-generic                         3.16.0.29.30

Stephane
