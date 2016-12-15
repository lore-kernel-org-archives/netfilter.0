From: Tom Hacohen <tom@stosb.com>
Subject: Re: nftables: masquerade sets wrong source address
Date: Thu, 15 Dec 2016 11:34:57 +0000
Message-ID: <CAEvi_o-B50n-qZyRxHC9cmpsjiweidcufFifB0SYsp515THwzQ@mail.gmail.com>
References: <CAEvi_o9_SJNGH-RWq6Kt+UiXVY4ozaMy3yJ2rPdV0Rbk1QrRZw@mail.gmail.com>
 <20161214222856.GA3797@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stosb.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ZwxCglAfU1vxDBOJ+M8xbKsQ7hX+JkPq6DF+u/Pqr6o=;
        b=KcuCuSlwt21uaQN7pQ8ziODEHc8Dum+RxlWIP8+HZciFh2KA0O5WYDkKWfV1cqtawO
         4mRyGVJACOOCMbSW10fIW4vR93B1KdpFU/SrfqCB8MzzF/NO/EwMeBMC1gfLy2K64eOH
         EYps13b0jFYAV48gN6788v09K43L3qI7D9FHc=
In-Reply-To: <20161214222856.GA3797@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Wed, Dec 14, 2016 at 10:28 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Hi Tom,
>
> On Tue, Dec 13, 2016 at 01:28:41PM +0000, Tom Hacohen wrote:
>> Hi,
>>
>> I've recently migrated from iptables (no modules loaded anymore) to
>> nftables and came across a weird situation that looks like a bug to
>> me.
>>
>> When using "masquerade" it always sets the ip address to that of one
>> of my interfaces, and not per interface as one would expect.
>>
>> My config:
>>
>> flush ruleset
>>
>> table inet filter {
>>     chain input {
>>         type filter hook input priority 0; policy accept;
>>
>>         iifname lo log accept
>>     }
>>     chain output {
>>         type filter hook output priority 0; policy accept;
>>     }
>> }
>>
>> table ip nat {
>>     chain postrouting {
>>         type nat hook postrouting priority 100;
>>         masquerade
>>     }
>> }
>>
>>
>> With this, connections to localhost fail because the masquerade line
>> sets the source IP to that of the wlp1s0 interface, and not of the lo
>> interface.
>>
>> Here is output from the log:
>> IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00
>> SRC=192.168.86.18 DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64
>> ID=64500 DF PROTO=TCP SPT=36844 DPT=8000 WINDOW=43690 RES=0x00 SYN
>> URGP=0
>>
>> You can see how the source ip is wrong. This is from running "curl"
>> trying to connect to a local http server on port 8000.
>>
>> Removing the masquerade line, or changing it to: "oifname wlp1s0
>> masquerade" fixes it, but this is just a workaround that will fail in
>> more complex situations.
>>
>> I would have loved to provide you with tracing information, but
>> unfortunately I never got that to work for me.
>>
>> Tried with kernels: 4.8.12 and 4.4.35 on arch linux. Nft version is 0.6.
>>
>> Please let me know if there's any other info you'd like me to provide you with.
>
> I don't remember if this behaviour has been always the case. Would you
> please check what has been the behaviour in old kernels?
>
> nftables shares this masquerade code with iptables, so you can test
> this with iptables in older kernels.


Hey,

Thanks for your reply.

I'm sorry, but I don't have access to older kernels. Furthermore, this
worked with
iptables on the same kernel version using the same rules as far as I can tell.
I therefore suspect (without knowing the code) that maybe nftables is trying
to masquerade all packets while iptables maybe has a noop when there was no
NAT applied, or if the address is already set correctly? That is the best
explanation that comes to mind given your assertion about them sharing the
masquerade code.

Thanks.

--
Tom.
