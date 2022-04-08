From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Error when using 'time' statement in nftables 1.0.2 rule
Date: Fri, 8 Apr 2022 10:17:15 +0200
Message-ID: <Yk/vi+/HGMjfhjpr@salvia>
References: <CANf9dFMQO4mHXFd88BHL5u9BWyp-v-Tu2L6x_oS1OdMp8UrhhA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANf9dFMQO4mHXFd88BHL5u9BWyp-v-Tu2L6x_oS1OdMp8UrhhA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Gignac <martin.gignac@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Apr 07, 2022 at 10:19:30PM -0400, Martin Gignac wrote:
> Hello,
> 
> On nftables 1.0.1, I can run this command just fine:
> 
>     nft> add rule inet filter input iif lo time < "2022-07-01 11:00" accept
>     nft>
> 
> On 1.0.2, however, it gives me this error:
> 
>     nft> add rule inet filter input iif lo time < "2022-07-01 11:00" accept
>     Error: No symbol type information
>     add rule inet filter input iif lo time < "2022-07-01 11:00" accept
>                                     ^^^^
> Have I encountered a bug, or has the usage of the 'time' statement
> simply changed?

I can reproduce it, this is a bug.

I cannot reproduce it though with current nftables git snapshot (it's
basically 1.0.2 with a few patches on top).
