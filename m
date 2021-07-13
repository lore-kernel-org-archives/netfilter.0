From: rakesh goyal <goyal.rakesh@gmail.com>
Subject: Re: Netfilter rules to replicate, consume ingress packet locally and
 forward clone packet
Date: Tue, 13 Jul 2021 17:10:05 +0530
Message-ID: <CANaqFbqyJjmRj60Sbj1==SY8A3+8p=pnAv+FvEs9Yu=hAJ=Wtw@mail.gmail.com>
References: <CANaqFbrZgViUKTvgEFje3yf0ozsstcst8_gjX84aw03WXOw_tQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=54cfHQUbBar7G9wspLC5rQrL1uVHB0m8YGfRNAhx5Ns=;
        b=T6e6PA+3PMTa82aW5qwj9B8LUnM3dkYMLiYHPCrDc57PkHQdss+frpjZK/Kg2aHyWY
         OgUwCRaNKGxkv79JwSsHPQs0tJdhrQqzVBEfGanxWMxJlVvo05pD5ccKWJ+QaraUKaei
         u0JetUfIrPp7SyA1GKG4MdMpF66EedxU+ptPWqT+Dp155J07201vIJDcTP8QInk1A3tZ
         48hwPy3xL/8GZWz+Xyxn839Ya0fLXeLgdu+Y76Q0p+IULE0tbHaM8C2OBJMI3Kop9lCV
         SdrXDOK1ntXdp3AR2Fkz5cokby8rysLLXwln93nZmm3BSA6i4xZ70a90j858o11J/tu8
         +g/A==
In-Reply-To: <CANaqFbrZgViUKTvgEFje3yf0ozsstcst8_gjX84aw03WXOw_tQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Any update on my query.
~Rakesh G

On Mon, Jul 12, 2021 at 8:49 PM rakesh goyal <goyal.rakesh@gmail.com> wrote:
>
> Hi,
> I am looking for netfilter rules to accomplish the following requirements.
> 1. every UDP packet received on the interface i.e. eht0 should be
> consumed locally.
>  2. replicate same packet and Forward to other interface i.e. enp7s0
>
> experiment done.
> 1 .Host PC IP 192.168.1.3 which is connected to DUT eth0.
> 2. DUT  eth0 - 192.168.1.4
>          enp7s0  10.40.197.108
> 3. Another Host which is in 10.40... network having IP 10.40.198.9
> connected to     enp7s0 of DUT.
>
> Rules :
> sudo iptables -t mangle -A PREROUTING -d 192.168.1.4  -j TEE --gateway
> 10.40.198.9
> sudo iptables -t nat -A OUTPUT -s 192.168.1.3 -j DNAT --to-destination
> 10.40.198.9
> sudo iptables -t mangle -A INPUT -s 192.168.1.3  -j ACCEPT
>
> Issue Seen with this rule:
> 1. packets from #1 Host PC get cloned until TTL becomes 1/0. So there
> are multiple replications.
>
> please help here to understand the correct rules for the requirement.
>
> Regards,
> Rakesh



-- 
|2/-\1<|=&|-|
