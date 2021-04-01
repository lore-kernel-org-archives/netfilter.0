From: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: Re: nft show counter
Date: Thu, 01 Apr 2021 20:31:09 +0200
Message-ID: <902B82E6-79AE-4C04-B2CA-C860662911EC@public-files.de>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62> <20210331214053.GB13699@breakpoint.cc> <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com> <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06> <20210401181414.GF13699@breakpoint.cc>
Reply-To: frank-w@public-files.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617301875;
        bh=zkUHH6nuNVcJpwUu1kNzcH/8Ef0NjJcDs0q0nFCkgtM=;
        h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
         CC:From;
        b=lJSy2zZgKt8hJQF4gxub5Rru0vGUbOhBmbxciyhRcZVw1lCMCBBBDhvezu8sb5gq8
         1DaXH7bLpa4jaAhHp33MYnFXzytWhcSRZqMl7N+xw8mwi53VAxTyokk0OmB/ZKj5C/
         1Hz00KBox4hFUYKb6MVMGiCZ+k5o/xUC02KZmAhw=
In-Reply-To: <20210401181414.GF13699@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: Frank Myhr <fmyhr@fhmtech.com>, netfilter@vger.kernel.org

Am 1=2E April 2021 20:14:14 MESZ schrieb Florian Westphal <fw@strlen=2Ede>:
>Frank Wunderlich <frank-w@public-files=2Ede> wrote:
>> my rules-file looks like this now (just for anybody wants do do
>similar):
>>=20
>> table ip filter {
>>     =2E=2E=2E
>>     chain FORWARD {
>>         type filter hook forward priority 0; policy drop;
>>         #=2E=2E=2E
>>         ip saddr $ipvoipbox udp dport 5160 counter name voip1 comment
>"counting packets for SIP1"
>>         ip daddr $ipvoipbox udp dport 5160 counter name voip1 comment
>"counting packets for SIP1"
>>         ip saddr $ipvoipbox udp sport 5161 counter name voip2 comment
>"counting packets for SIP2"
>>         ip daddr $ipvoipbox udp dport 5161 counter name voip2 comment
>"counting packets for SIP2"
>>         #=2E=2E=2E
>>     }
>
>For two counters it makes no difference but note that you can combine
>named counters with maps:
>
>map voipcounters {
> type ipv4_addr =2E inet_service : counter
> elements =3D { 10=2E0=2E1=2E1 =2E 5160 : "voip1", 10=2E2=2E1=2E1 =2E 516=
1 : =2E=2E=2E
>
>and then count with one rule only:
>
>counter name ip saddr =2E udp dport map @voipcounters

Have seen maps,but have not understood them :(

The ip is always same ($ipvoipbox),only port differs (sip1+sip2) and this =
bidirectional (saddr/daddr,sport/dport) to catch traffic from/to this ip se=
parated by sip-streams=2E

Your example seems to match only source-addr and destination port=2E

Maybe its possible to match "addr" (saddr or daddr) and "port" (sport or d=
port),so i can have only 2 rules=2E=2E=2Ewith map maybe only 1

Maybe i can do further protocol filtering (filter out registrations to not=
 count failed registrations,only working traffic)=2E

>> one thing:
>>=20
>> # nft list counter filter voip2
>> table ip mangle {
>> }
>> table ip nat {
>> }
>> table ip filter {
>> 	counter voip2 {
>> 		packets 124 bytes 7440
>> 	}
>> }
>
>Can't repro so looks like this is already fixed=2E
>
>> tables mangle and nat should not be printed (still have them
>separately from converting iptables to nft)=2E=2E=2Ein json-format it is
>right
>
>Yes, they should not be printed=2E

I try this again with upstream nft
Hi,
regards Frank
