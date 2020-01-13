From: david NEW <david@hajes.org>
Subject: Re: nftables static routing fails
Date: Mon, 13 Jan 2020 22:59:06 +0100
Message-ID: <601b51d0-e31a-0de7-8827-a8e92bcdabcd@hajes.org>
References: <967a25ca-ed80-b13e-a301-0907081debbf@hajes.org>
 <20200113214002.GJ795@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hajes.org; s=f2019;
        t=1578952747; bh=+WMPMOkPptWoVajWrKkPUHjpNAiYowrVK5EVp3bH1aA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
        b=NCxOQfrB3GpcxmdQyCVqqbr2r4yQnpQDhAMRLLsi292Mjb57hXZBEh9wMfOWgJBzq
         UummON6uQEWqtQxaJ73ZgNyDIWsCCjqo25vgXQULkgIWeYUiQRzjh0yb91VUVHpMgj
         4j60bQyhy2GqO1Dx/XJBNYabRrbX91GIoYWrqi4X8K3vOAQOnjIno6QJMJUQeCBpE9
         /oX7FzRhW3zWo+KzRpXPJMnMgf/JmZFptsnu//p0610Wc6JspUji9S51yJkIqHCEh8
         pQK40XRP4M/LpRSMJZaHqkOJzDlPOzR+wNqTmcbsd110f65UE3R6VLqNj43uPYowDq
         Ngw/MgXNA3U/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hajes.org; s=f2019;
        t=1578952747; bh=+WMPMOkPptWoVajWrKkPUHjpNAiYowrVK5EVp3bH1aA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
        b=NCxOQfrB3GpcxmdQyCVqqbr2r4yQnpQDhAMRLLsi292Mjb57hXZBEh9wMfOWgJBzq
         UummON6uQEWqtQxaJ73ZgNyDIWsCCjqo25vgXQULkgIWeYUiQRzjh0yb91VUVHpMgj
         4j60bQyhy2GqO1Dx/XJBNYabRrbX91GIoYWrqi4X8K3vOAQOnjIno6QJMJUQeCBpE9
         /oX7FzRhW3zWo+KzRpXPJMnMgf/JmZFptsnu//p0610Wc6JspUji9S51yJkIqHCEh8
         pQK40XRP4M/LpRSMJZaHqkOJzDlPOzR+wNqTmcbsd110f65UE3R6VLqNj43uPYowDq
         Ngw/MgXNA3U/w==
In-Reply-To: <20200113214002.GJ795@breakpoint.cc>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

I did run "tcpdump port 80" where I saw incoming packet. Then repeated=20
process but watching port 8080 this time but no packets have been=20
captured. I assumed it never went through.

I have never worked with tcpdump before so there may be some mistakes on=20
my side.

I do not know what is "reverse xlate rule" - can you show me how would=20
you write this rule, please?

I do not care how it is written as long as netfilter rule checks source=20
address (from set) that asks for connection to port 80, 443...and=20
redirects it to IP:8080 where web server error page awaits.

It is ip or cidr set/list of repeated attackers from netfilter log but I=20
run "commercial" web site and I wanna inform blocked people who may be=20
legit vistiors.

Sadly, IPv4 blocking is joke and most Internet users are unaware that=20
they became part of botnet and their shared IP is blocked.


On 13/01/2020 22:40, Florian Westphal wrote:
> david NEW <david@hajes.org> wrote:
>> hi,
>>
>> I am trying to route blocked ip set to IP:8080 where is info about "you =
have
>> been blocked"
>>
>> table ip raw {
>>  =A0=A0=A0 set bad_ip {'
>>  =A0=A0=A0=A0=A0=A0=A0 type ipv4_addr
>>  =A0=A0=A0=A0=A0=A0=A0 elements =3D { xxx.xxx.xxx.xxx }
>>  =A0=A0=A0 }
>>
>> chain prerouting {
>>
>>  =A0=A0=A0 type filter hook prerouting priority -500; policy accept;
>>  =A0=A0=A0 nft add raw preroute ip saddr @bad_ip tcp dport { 80, 443 } i=
p daddr set
>> xxx.xxx.xxx.xxx tcp dport set 8080 notrack
>> }
>>
>>
>> netfilter doesn't complain about this rule but nothing happens...connect=
ion
>> timed out and nothing happened. I see no errors in Apache2 logs.
>>
>> I can see connection attempt in tcpdump but it is not redirected.
> How do you know from tcpdump?  tcpdump occurs before port rewrite.
>
> You should see syn to foo:80, then a syn-ack from xxx.xxx.xxx.xxx:8080.
>
> As original client connected to foo:80, the syn-ack is dropped on client
> side.
>
> You need to add a reverse xlate rule if you really want this, or use
> normal redirect via nat.
