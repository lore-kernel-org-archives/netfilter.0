From: Tom Hacohen <tom@stosb.com>
Subject: Re: nftables: masquerade sets wrong source address
Date: Fri, 16 Dec 2016 00:04:22 +0000
Message-ID: <CAEvi_o9Mhn0UgfkOHmYQEJzzhy5=T6V4ECK=ccmsJ7vZHhM9gA@mail.gmail.com>
References: <CAEvi_o9_SJNGH-RWq6Kt+UiXVY4ozaMy3yJ2rPdV0Rbk1QrRZw@mail.gmail.com>
 <20161214222856.GA3797@salvia> <CAEvi_o-B50n-qZyRxHC9cmpsjiweidcufFifB0SYsp515THwzQ@mail.gmail.com>
 <20161215212930.GA13769@salvia> <CAEvi_o9xnNnfv3OMjGKiD=j1W_i-rzQkn1md+SV9Oj5p7g458g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stosb.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Mahj2InTED5oZJwzqz7d1WCtrPWfGZhbbO5+imfspDg=;
        b=qMN8Jh8kVbUDBcxE33YAcxiHlSPsM3I+R5iv4WQF0eSE//47M+6VtW+GLxuIKP+uDf
         eW0FO2CE2nfiOA5xw5uOIOdzk8/oB8a4+NiPx7i4sfuTNuXU1MONtodwdcImGJ1vyPzG
         HZ3nsOzrZ1ALnSxVV2bweEUydIkWNlQqDcbRc=
In-Reply-To: <CAEvi_o9xnNnfv3OMjGKiD=j1W_i-rzQkn1md+SV9Oj5p7g458g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

I'm very confused, just ran the same iptables rules on a freshly
booted different box running 4.4.38 and got:

IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00
SRC=192.168.86.10 DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64
ID=17313 DF PROTO=TCP SPT=34548 DPT=8000 WINDOW=43690 RES=0x00 SYN
URGP=0
IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1
DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
SPT=8000 DPT=34548 WINDOW=43690 RES=0x00 ACK SYN URGP=0

On the other hand, again, after a fresh boot, this time with nftables,
I'm getting:

IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00
SRC=192.168.86.10 DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64
ID=21924 DF PROTO=TCP SPT=48948 DPT=8000 WINDOW=43690 RES=0x00 SYN
URGP=0
IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1
DST=192.168.86.10 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
SPT=8000 DPT=48948 WINDOW=43690 RES=0x00 ACK SYN URGP=0
IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00
SRC=192.168.86.10 DST=127.0.0.1 LEN=40 TOS=0x00 PREC=0x00 TTL=64
ID=58958 DF PROTO=TCP SPT=48948 DPT=8000 WINDOW=0 RES=0x00 RST URGP=0

I have no idea what is going on. In all of the tests in this thread
I've been using "python3 -m http.server" as the test http server and
curl as the client.

Can you make sense of why I it replies to 127.0.0.1 with iptables, and
to 192.168.86.10 (my lan ip) on the other? Also, why doesn't it
masquerade the packets after the first one in the iptables case?

I also made two additional tests: I started my box ran nftables, it
failed as expected, then I ran iptables, it worked and then I ran
nftables, and it *worked*.
Maybe when iptables initialises masquerading it does it differently
from nftables?

Is there anything else you'd like me to test?

On Thu, Dec 15, 2016 at 10:47 PM, Tom Hacohen <tom@stosb.com> wrote:
> On Thu, Dec 15, 2016 at 9:29 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>> Hi Tom,
>>
>> On Thu, Dec 15, 2016 at 11:34:57AM +0000, Tom Hacohen wrote:
>>> Hey,
>>>
>>> Thanks for your reply.
>>>
>>> I'm sorry, but I don't have access to older kernels. Furthermore,
>>> this worked with iptables on the same kernel version using the same
>>> rules as far as I can tell.
>>
>> Hm, this is working with the same kernel version in iptables? What
>> kernel version are you using?
>>
>>> I therefore suspect (without knowing the code) that maybe nftables is trying
>>> to masquerade all packets while iptables maybe has a noop when there was no
>>> NAT applied, or if the address is already set correctly? That is the best
>>> explanation that comes to mind given your assertion about them sharing the
>>> masquerade code.
>>
>> Both nft and iptables share the same codebase for NAT/masquerade, so
>> if this works with iptables, it shoud work with nft too in the same
>> way.
>>
>> Please, confirm this, it would be good if we get to the core of the
>> problem. If the behaviour differs, or started to differ from some
>> kernel version on, then this is a bug.
>>
>
> Hi,
>
> I can't be sure what I tested on before, because I had a setup that
> used to work, and then I switched to nftables. I don't remember if I
> updated the kernel since migrating, but even if I had, it was 4.4.x
> for sure and probably 4.4.34/35. However, I can say for certain that
> it used to work for years until very recently, whatever the reason may
> have been.
>
> FWIW, I'm now testing on 4.8.13 and can confirm it's broken with both.
>
> I just tested with iptables, and the same masquerade happens for that,
> so I can confirm that the behaviour is the same with this
> configuration.
>
> SRC=192.168.86.18 DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64
> ID=46247 DF PROTO=TCP SPT=46026 DPT=8000 WINDOW=43690 RES=0x00 SYN
> URGP=0
> SRC=127.0.0.1 DST=127.0.0.1 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=59070
> DF PROTO=TCP SPT=8000 DPT=46026 WINDOW=0 RES=0x00 ACK RST URGP=0
>
> Here's the iptables config I used to get these results, which (to me)
> seems identical to the original nftables config:
> *nat
> :PREROUTING ACCEPT [4:252]
> :INPUT ACCEPT [4:252]
> :OUTPUT ACCEPT [1:76]
> :POSTROUTING ACCEPT [0:0]
> -A POSTROUTING -j MASQUERADE
> COMMIT
>
> *filter
> :INPUT DROP [0:0]
> :FORWARD DROP [0:0]
> :OUTPUT ACCEPT [0:0]
> -A INPUT -i lo -j LOG
> -A INPUT -i lo -j ACCEPT
> COMMIT
>
> Other the above, there's nothing interesting in my previous
> "production" iptables config that used to work. Unfortunately I can't
> abuse the production machine any longer by changing the firewall rules
> or jumping back and forth between iptables and nftables.
>
> Is there anyone with an older lts kernel that can check this? If so,
> don't forget to clear your modules, because the nftables nat modules
> clash with the iptable ones.
>
> Regression-hunting aside for a moment, it still looks like a bug to
> me, even if that bug shared with iptables. There is a simple
> workaround, just don't masquerade for lo, but still, this looks like
> something that should be fixed.
>
> Please let me know if there's anything else I can do to help.
>
> --
> Tom
