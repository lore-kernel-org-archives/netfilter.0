From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables v0.9.2] hoplimit mutually exclusive with with
 saddr/daddr?
Date: Sun, 2 Feb 2020 17:32:13 +0000
Message-ID: <f65d06b4-bd10-bcbc-a0bc-488a378488f5@gmx.net>
References: <af5c5ee0-ae0b-1832-73a2-35c34ed7f844@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580664733;
        bh=d6e1McpVDUBl1i8dCkbs9ADUbceyJ4QU375vKPYF22g=;
        h=X-UI-Sender-Class:Reply-To:Subject:From:To:References:Date:
         In-Reply-To;
        b=UvvS1QnBfUsNODYQBd6pA3kgDDqS0JMUxB04QdtRXVhT4eNKtDa5AkSZqrqlGEl+6
         eCLDxC1ccdDxWTpZoI94Rdh/pT4euccOt8KcxC5yN4zDO+9BuDr/QnEB0WuDagVPBr
         fXIAu2MUyR18LK6yVunRPIU8ob0AxtvtYwHTU+aM=
In-Reply-To: <af5c5ee0-ae0b-1832-73a2-35c34ed7f844@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

On 02/02/2020 17:13, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
> Trying to implement in the ip6 filter table / chain input:
>
> iif eth2 ip6 hoplimit 1 saddr fc00::/6 udp sport 547 ip6 daddr=20
> fc00::/6 udp dport 546 accept;
>
> However, that throws
>
> Error: syntax error, unexpected saddr, expecting newline or semicolon
>
> Is this expected since hoplimit being pertinent to the header whilst=20
> saddr/daddr are not?
>

Well, apparently a syntax error - having misses on ip6...

iif eth2 ip6 hoplimit 1 ip6 saddr fc00::/6 udp sport 547 ip6 daddr=20
fc00::/6 udp dport 546 accept;

then works.

