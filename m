From: Alberto <alberto@bersol.info>
Subject: Re: [nftables] Log to DNAT rule
Date: Mon, 12 Oct 2020 12:31:12 +0200
Message-ID: <d847854e-8457-fc84-dca7-f1a4fedb978a@bersol.info>
References: <dfc15fba-2fff-a658-c4db-fc0a64603fb6@bersol.info>
 <1b8888e3-f368-73d0-c8cc-b4e04ff4901a@bersol.info>
 <CAKcfE+aM_r4J9t=8GnjhXbZfBeDj7B2_66O_CYeY94NpvWcxOw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bersol.info; s=dkim;
        t=1602498672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=i/fP7fAq70siJv/CgpJ301pODf5AGoPNlXP3FBWgknY=;
        b=g426tmVIx6XmEGbo9oVweTjI69DFExVoeTb4nWXHAz4m4/+WUMDR/1MBamo+Eu+0zDMY5R
        m7ISwSAV2WKqOcKmjkmuaaQ9GrphJtEpMrPA943FIaQYtHG9DZUReFaBqMwxIdXXwmpxLZ
        Q8186qUCwsU5APIHuc7GfTZNgOPsyNA=
In-Reply-To: <CAKcfE+aM_r4J9t=8GnjhXbZfBeDj7B2_66O_CYeY94NpvWcxOw@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Thank you Bazsi,

I understand the concept, but I don't know how to do it.

Can you post any rule example?


Thanks

El 12/10/20 a las 7:17, Balazs Scheidler escribió:
> By the time the packet gets to PREROUTING/input the nat transformation
> is already applied, so your ruleset doesn't see the original port.
> 
> You will need to match against its state (as someone mentioned) or mark
> it when doing the dnat decision and check the mark as it will persist
> accross the nat manipulation.
> 
> Bazsi
> 
> On Sun, Oct 11, 2020, 20:02 Alberto <alberto@bersol.info
> <mailto:alberto@bersol.info>> wrote:
> 
> 
> 
>     Hi everybody,
> 
>     I'm starting with nftables, and I want to log SSH inputs, but I have SSH
>     port in another port with "prerouting" with this rule:
> 
>     -----------------------------------------------
>     table ip my-nat {
>       chain PREROUTING {
>           type nat hook prerouting priority 0; policy accept;
>           iifname "enp1s0" tcp dport 9999 dnat to 192.168.1.3:22
>     <http://192.168.1.3:22>
>           ...
>     -----------------------------------------------
> 
>     If my Input rule is the following...
> 
>     -----------------------------------------------
>     table inet my-fw {
>       chain INPUT {
>          type filter hook input priority 0; policy drop;
>          ...
>          # Ports permit with DNAT...
>          iifname "enp1s0" tcp dport { 22, 9999 } ct state new log prefix
>     "[NFTABLES] SSH: " accept
>          ...
>     -----------------------------------------------
> 
>     But this log any try to 22 port (there are thousands daily), and I want
>     log only conections to 9999 port, because only on this port, return
>     login.
> 
>     If my Inputs rule are the following...
> 
>     -----------------------------------------------
>          ...
>          iifname "enp1s0" tcp dport 9999 ct state new log prefix "[NFTABLES]
>     SSH: " accept
>          iifname "enp1s0" tcp dport 22 ct state new accept
>          ...
>     -----------------------------------------------
> 
>     It log nothing.
>     If my Inputs rule is the reverse...
> 
>     -----------------------------------------------
>         ...
>         iifname "enp1s0" tcp dport 9999 ct state new accept
>         iifname "enp1s0" tcp dport 22 ct state new log prefix "[NFTABLES]
>     SSH: " accept
>          ...
>     -----------------------------------------------
> 
>     It log everything, another time, is the same as the initial rule.
> 
> 
>     Any Idea?
> 
>     Regards,
>     Alberto
> 
