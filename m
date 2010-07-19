From: Sergei Zhirikov <sfzhi@yahoo.com>
Subject: Re: question about esp and policy matching rule
Date: Mon, 19 Jul 2010 13:14:00 +0200
Message-ID: <i21c1p$cl6$1@dough.gmane.org>
References: <OFC79F2599.5D7A2E5E-ON85257765.0011E584-86257765.0013332D@us.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <OFC79F2599.5D7A2E5E-ON85257765.0011E584-86257765.0013332D@us.ibm.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 2010-07-19 05:29, Richard Knight wrote:
>
> Hello,
>
>   I don't fully understand the two rules below.
>
> Since each of the rules are get inserted at position 1 in the table the ESP
> rule ends up below the policy matching rule, will the ESP rule ever be
> checked?
>
> # allow all ipsec traffic into and out
> $IP6_TABLES -I INPUT  1 -i $EXIF -p esp -j ACCEPT
> $IP6_TABLES -I OUTPUT 1 -o $EXIF -p esp -j ACCEPT
> $IP6_TABLES -I INPUT  1 -i $EXIF -m policy --dir in  --pol ipsec  -j ACCEPT
> $IP6_TABLES -I OUTPUT 1 -o $EXIF -m policy --dir out --pol ipsec  -j ACCEPT
>
> I have an application which does not seem to operate through my ipsec
> tunnel without both rules in place, I'm having trouble figuring out why.
>

The order of those rules does not matter. They have different purpose and match different packets.

With IPSec involved packets pass netfilter twice. For example, if you have an incoming ESP packet
that contains an UDP packet as payload the following happens.

1. The ESP packet passes netfilter and matches the line with "-I INPUT -p esp"
2. The packet is decrypted and its payload (the UDP packet in this example) is processed further
3. The UDP packet passes netfilter and matches the line with "-I INPUT -m policy ...".

In other words, "-m policy" applies to packets after IPSec decapsulation (or before encapsulation, for outgoing packets).

--
Sergei.

