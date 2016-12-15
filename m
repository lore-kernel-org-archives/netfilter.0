From: Tom Hacohen <tom@stosb.com>
Subject: Re: nftables: masquerade sets wrong source address
Date: Thu, 15 Dec 2016 22:47:45 +0000
Message-ID: <CAEvi_o9xnNnfv3OMjGKiD=j1W_i-rzQkn1md+SV9Oj5p7g458g@mail.gmail.com>
References: <CAEvi_o9_SJNGH-RWq6Kt+UiXVY4ozaMy3yJ2rPdV0Rbk1QrRZw@mail.gmail.com>
 <20161214222856.GA3797@salvia> <CAEvi_o-B50n-qZyRxHC9cmpsjiweidcufFifB0SYsp515THwzQ@mail.gmail.com>
 <20161215212930.GA13769@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stosb.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=cJ6ecetFBLM09plx0Dv7sl8KCsCs60mgPC1/DLjolRE=;
        b=IplkeiYDqjoX33oS3Cq2aV+z0cagLC1GANyCPgvOkZzJJClYmQNlp8NsZLBmfNOJEt
         KRr+o9MsCaB7EyFKJD8yw0ud/B05S+7QWm9tvkus6OKH3MvoNZsaMGL8I6YsWvQyWy12
         Y6+4rcw8qIhlB0bi3nF/05mwDoGIKekJZuc0M=
In-Reply-To: <20161215212930.GA13769@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Thu, Dec 15, 2016 at 9:29 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Hi Tom,
>
> On Thu, Dec 15, 2016 at 11:34:57AM +0000, Tom Hacohen wrote:
>> Hey,
>>
>> Thanks for your reply.
>>
>> I'm sorry, but I don't have access to older kernels. Furthermore,
>> this worked with iptables on the same kernel version using the same
>> rules as far as I can tell.
>
> Hm, this is working with the same kernel version in iptables? What
> kernel version are you using?
>
>> I therefore suspect (without knowing the code) that maybe nftables is trying
>> to masquerade all packets while iptables maybe has a noop when there was no
>> NAT applied, or if the address is already set correctly? That is the best
>> explanation that comes to mind given your assertion about them sharing the
>> masquerade code.
>
> Both nft and iptables share the same codebase for NAT/masquerade, so
> if this works with iptables, it shoud work with nft too in the same
> way.
>
> Please, confirm this, it would be good if we get to the core of the
> problem. If the behaviour differs, or started to differ from some
> kernel version on, then this is a bug.
>

Hi,

I can't be sure what I tested on before, because I had a setup that
used to work, and then I switched to nftables. I don't remember if I
updated the kernel since migrating, but even if I had, it was 4.4.x
for sure and probably 4.4.34/35. However, I can say for certain that
it used to work for years until very recently, whatever the reason may
have been.

FWIW, I'm now testing on 4.8.13 and can confirm it's broken with both.

I just tested with iptables, and the same masquerade happens for that,
so I can confirm that the behaviour is the same with this
configuration.

SRC=192.168.86.18 DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64
ID=46247 DF PROTO=TCP SPT=46026 DPT=8000 WINDOW=43690 RES=0x00 SYN
URGP=0
SRC=127.0.0.1 DST=127.0.0.1 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=59070
DF PROTO=TCP SPT=8000 DPT=46026 WINDOW=0 RES=0x00 ACK RST URGP=0

Here's the iptables config I used to get these results, which (to me)
seems identical to the original nftables config:
*nat
:PREROUTING ACCEPT [4:252]
:INPUT ACCEPT [4:252]
:OUTPUT ACCEPT [1:76]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -j MASQUERADE
COMMIT

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -i lo -j LOG
-A INPUT -i lo -j ACCEPT
COMMIT

Other the above, there's nothing interesting in my previous
"production" iptables config that used to work. Unfortunately I can't
abuse the production machine any longer by changing the firewall rules
or jumping back and forth between iptables and nftables.

Is there anyone with an older lts kernel that can check this? If so,
don't forget to clear your modules, because the nftables nat modules
clash with the iptable ones.

Regression-hunting aside for a moment, it still looks like a bug to
me, even if that bug shared with iptables. There is a simple
workaround, just don't masquerade for lo, but still, this looks like
something that should be fixed.

Please let me know if there's anything else I can do to help.

--
Tom
