From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Re: intermittent nat issue
Date: Sat, 21 Jan 2017 01:33:06 +0100
Message-ID: <2cb772b8-476f-3136-910e-dea552c6d80c@conversis.de>
References: <6a6cc500-9c8a-4075-f856-fb5d90f0571b@pkfnet.co.za>
 <1e5b43088d9a493faee12f3027ce8aa5@aalto.fi>
 <64c68c3a-9397-a93b-4cc4-8e6db25e02c6@pkfnet.co.za>
 <14ec9b85-d18b-db28-b0a1-3459835da78e@conversis.de>
 <04c2569a9abf471b98c6b759271a4431@aalto.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <04c2569a9abf471b98c6b759271a4431@aalto.fi>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Llorente Santos Jesus <jesus.llorente.santos@aalto.fi>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Mark Coetser <mark@pkfnet.co.za>

Hi,
when I do a tcpdump of these packets and then immediately look into the
conntrack table I can find no associated entries there suggesting that
the entries have indeed been removed right away without any sort of timeout.

Regards,
  Dennis

On 20.01.2017 16:23, Llorente Santos Jesus wrote:
> Hi, 
> I wouldn't think that is the problem...as far as I know conntrack sets specific timeouts on the connections to match with the actual conntrack state.
> You can see these via
> sysctl -a |  grep net.netfilter.nf_conntrack_
> 
> Best,
> Jesus
> 
> -----Original Message-----
> From: Dennis Jacobfeuerborn [mailto:dennisml@conversis.de] 
> Sent: 20 January 2017 12:37
> To: Mark Coetser <mark@pkfnet.co.za>; Llorente Santos Jesus <jesus.llorente.santos@aalto.fi>; netfilter@vger.kernel.org
> Subject: Re: intermittent nat issue
> 
> On 20.01.2017 10:47, Mark Coetser wrote:
>> Hi Llorente
>>
>> I did run conntrack -F to check that but still had the unnatted 
>> packets traversing the interface.
>>
> 
> Hi, I'm seeing this as well on our systems. One thing I notice is that all packets either the RST of FIN flag set. Could this be some sort of race condition where Conntrack removes the connection from the table because of the flags and as a result the final packet will not get masqueraded/nat'ed?
> 
> Regards,
>   Dennis
> 
> N�����r��y���b�X��ǧv�^�)޺{.n�+���z��׫�{ay�ʇڙ�,j��f���h���z��w������j:+v���w�j�m��������zZ+�����ݢj"��!tml=
> 

