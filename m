From: =?UTF-8?Q?Humberto_Juc=C3=A1?= <betolj@gmail.com>
Subject: Re: DNAT working for one host but not another
Date: Mon, 5 Dec 2016 12:52:15 -0300
Message-ID: <CACuyg26fDUzT0UeUjCHkBaj7j6b441vNEh1T-_pj2Gw-OCyrfw@mail.gmail.com>
References: <1480878101.19944.29.camel@interlinx.bc.ca> <1480878397.19944.31.camel@interlinx.bc.ca>
 <aab4caed2f9f4941b0749ef4875d5761@aalto.fi> <1480949008.19944.60.camel@interlinx.bc.ca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=BgacBzZMpdQ/1nr9Duuc2gm47QX5nNuuY4vYA5OB27U=;
        b=PwcsV/5AnY+9sFD/+euaYz24/+CH6njQMSVzMEdYyv3EmGxUxVXO53gZI85Luqb+PU
         jTqVXqLUirGfGZTJEeXoQUPH98NVenY6PIhWqHpUZxz1Jn8cYqmcFhSPn1t6ZxFAwtys
         ImhuckbG5m9ZSuQJXD1nQjSG7W2GIAP0IN+GnSqk+WMAcZDDkSK4LVxec8zx4mBijJ5Y
         eU5UCxrKRH5Ggm6ocqgjoLS96Lm64fNBtRgpv+rC/x0TlyxEkCplfh8xzB+PoCum0p4c
         2A39U08suGpEWWFyFheWk1oj1DpA/qmTfifsRZeD9vPmAve7b1nBPTA+AZLbqssrUX8Z
         Yygw==
In-Reply-To: <1480949008.19944.60.camel@interlinx.bc.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Brian J. Murrell" <brian@interlinx.bc.ca>, netfilter@vger.kernel.org

What are the nf_nat modules running in memory?

lsmod | grep "nf_nat_"


To do this you can't load nf_nat_sip!
When I worked with siproxy, i had to remove this module from memory.

2016-12-05 11:43 GMT-03:00 Brian J. Murrell <brian@interlinx.bc.ca>:
> On Mon, 2016-12-05 at 07:04 +0000, Llorente Santos Jesus wrote:
>> Hi Brian,
>>
>> Did you try using the REDIRECT target instead?
>
> I didn't before, but I just did and it doesn't seem to work either.
> Neither host gets ASSURED:
>
> udp      17 26 src=10.75.23.212 dst=10.75.22.8 sport=6060 dport=23768 [UNREPLIED] src=10.75.22.247 dst=10.75.23.212 sport=5060 dport=6060 mark=0 secctx=system_u:object_r:unlabeled_t:s0 use=1
> udp      17 28 src=10.75.22.200 dst=10.75.22.8 sport=6060 dport=23768 [UNREPLIED] src=10.75.22.8 dst=10.75.22.200 sport=23768 dport=6060 mark=0 secctx=system_u:object_r:unlabeled_t:s0 use=1
>
> and they both just keep getting ICMP port unreachable:
>
> 09:36:59.717222 IP 10.75.23.212.6060 > 10.75.22.8.23768: UDP, length 472
> 09:36:59.717340 IP 10.75.22.8 > 10.75.23.212: ICMP 10.75.22.8 udp port 23768 unreachable, length 508
> 09:37:01.839127 IP 10.75.22.200.6060 > 10.75.22.8.23768: UDP, length 472
> 09:37:01.839212 IP 10.75.22.8 > 10.75.22.200: ICMP 10.75.22.8 udp port 23768 unreachable, length 508
> 09:37:03.718815 IP 10.75.23.212.6060 > 10.75.22.8.23768: UDP, length 472
> 09:37:03.718921 IP 10.75.22.8 > 10.75.23.212: ICMP 10.75.22.8 udp port 23768 unreachable, length 508
> 09:37:05.218391 IP 10.75.22.200.6060 > 10.75.22.8.23768: UDP, length 0
>
> There is definitely something listening on the port:
>
> # netstat -pan | grep :5060
> udp        0      0 10.75.22.8:5060         0.0.0.0:*                           32519/foo
>
> But it really should work as a DNAT rule anyway.  It does for one host,
> just not another.  And has worked as such for all hosts for many years.
>  I just seems to have stopped working recently.
>
> Interestingly enough, it seems that now, the host which can't move to
> the ASSURED state is getting an ICMP port unreachable from the host:
>
> 09:20:47.041363 IP 10.75.22.200.6060 > 10.75.22.8.23768: UDP, length 471
> 09:20:47.041586 IP 10.75.22.8 > 10.75.22.200: ICMP 10.75.22.8 udp port 23768 unreachable, length 507
>
> Yet the other host obviously managed to reach it:
>
> udp      17 179 src=10.75.23.212 dst=10.75.22.8 sport=6060 dport=23768 src=10.75.22.8 dst=10.75.23.212 sport=5060 dport=6060 [ASSURED] mark=0 secctx=system_u:object_r:unlabeled_t:s0 use=1
> udp      17 26 src=10.75.22.200 dst=10.75.22.8 sport=6060 dport=23768 [UNREPLIED] src=10.75.22.8 dst=10.75.22.200 sport=23768 dport=6060 mark=0 secctx=system_u:object_r:unlabeled_t:s0 use=1
>
> I wonder if that sheds any more light on the problem.
>
> Cheers,
> b.
