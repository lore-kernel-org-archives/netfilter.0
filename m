From: Jens Koehler <jenskxxx@googlemail.com>
Subject: Re: Linux - nf_conntrack_count = 30684?
Date: Wed, 14 Sep 2016 14:54:25 +0200
Message-ID: <CAL7_A_XC_xRffjVVtq0f3UnFeFv6x7vzqcn3uFO8SJxKGi4tAg@mail.gmail.com>
References: <CAL7_A_XQXMFP598iP1nhUqvvmzE7GC5GUXcOoQ_2Y9YvRx8TOw@mail.gmail.com>
 <20160909132945.GA23757@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=137DUWs4klVXc5pQMbOgmf2WkDDpwZOdxvh7ZnNv49U=;
        b=eq3pp+idV3LcBMrghe0wAhJ1NApElPDBT00vMDKDiO279pxL7KR7XZ5Q1ocqrqas46
         U8dc1z0p8eBB9919PKU9rA4jY7jjDYyoHfvVa+FsBBuvZaPpaob9SmPbzm5hihq2Z3Vm
         iYUCiknSFZrEewAlQ2/JusGxfb6QqWaIhYm6ovZeuL4oUdoSEd6/z46XpzbybkZH9jy0
         BdLbSdplUfi+1VLWwIP+MWpKz4kFoY0/TDVnlCtsnBmlIEt1w2uhM7NNKk3DbK0TySlZ
         uZuxE/Ym3iks/lOOv2JGBFwXqkvRaEQeFKs3N9ZkEAayfEQ4st8XB5gfyu2ELwMkcNEO
         +1qw==
In-Reply-To: <20160909132945.GA23757@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Fri, Sep 9, 2016 at 3:29 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Fri, Sep 09, 2016 at 10:29:33AM +0200, Jens Koehler wrote:
>>  A Linux application reads cyclically data from up to 32 severs by
>> Tcp. After disconnecting of many/ all servers another Linux
>> application could not send data via the network interface by UDP.
>> nf_conntrack_count shows an unexpected high value:
>>
>> net.netfilter.nf_conntrack_count = 30684
>>
>> What means the number exactly?
>
> This is the number of conntrack entries in the table.
>
>> And what could be reason for so many open connections if no server
>> is connected?
>
> Do `conntrack -L' or `cat /proc/net/nf_conntrack' show entries?

 Yes, 'cat /proc/net/nf_conntrack' shows a huge number of following entries:
ipv4     2 tcp      6 109 SYN_SENT src=192.168.171.100
dst=192.168.171.160 sport=37660 dport=502 [UNREPLIED]
src=192.168.171.160 dst=192.168.171.100 sport=502 dport=37660 mark=0
use=2
ipv4     2 tcp      6 95 SYN_SENT src=192.168.171.100
dst=192.168.171.168 sport=6341 dport=502 [UNREPLIED]
src=192.168.171.168 dst=192.168.171.100 sport=502 dport=6341 mark=0
use=2
ipv4     2 tcp      6 105 SYN_SENT src=192.168.171.100
dst=192.168.171.112 sport=50811 dport=502 [UNREPLIED]
src=192.168.171.112 dst=192.168.171.100 sport=502 dport=50811 mark=0
use=2
ipv4     2 tcp      6 109 SYN_SENT src=192.168.171.100
dst=192.168.171.111 sport=25782 dport=502 [UNREPLIED]
src=192.168.171.111 dst=192.168.171.100 sport=502 dport=25782 mark=0
use=2
ipv4     2 tcp      6 103 SYN_SENT src=192.168.171.100
dst=192.168.171.155 sport=14076 dport=502 [UNREPLIED]
src=192.168.171.155 dst=192.168.171.100 sport=502 dport=14076 mark=0
use=2
ipv4     2 tcp      6 95 SYN_SENT src=192.168.171.100
dst=192.168.171.160 sport=34017 dport=502 [UNREPLIED]
src=192.168.171.160 dst=192.168.171.100 sport=502 dport=34017 mark=0
use=2
ipv4     2 tcp      6 100 SYN_SENT src=192.168.171.100
dst=192.168.171.105 sport=43547 dport=502 [UNREPLIED]
src=192.168.171.105 dst=192.168.171.100 sport=502 dport=43547 mark=0
use=2
ipv4     2 tcp      6 96 SYN_SENT src=192.168.171.100
dst=192.168.171.162 sport=22357 dport=502 [UNREPLIED]
src=192.168.171.162 dst=192.168.171.100 sport=502 dport=22357 mark=0
use=2
