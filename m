From: Mark Coetser <mark@pkfnet.co.za>
Subject: Re: intermittent nat issue
Date: Fri, 20 Jan 2017 11:47:01 +0200
Message-ID: <64c68c3a-9397-a93b-4cc4-8e6db25e02c6@pkfnet.co.za>
References: <6a6cc500-9c8a-4075-f856-fb5d90f0571b@pkfnet.co.za>
 <1e5b43088d9a493faee12f3027ce8aa5@aalto.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1e5b43088d9a493faee12f3027ce8aa5@aalto.fi>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Llorente Santos Jesus <jesus.llorente.santos@aalto.fi>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Llorente

I did run conntrack -F to check that but still had the unnatted packets 
traversing the interface.

-- 
Thank you,

Mark Adrian Coetser
mark@pkfnet.co.za

"The New York Times is read by the people who run the country.  The
Washington Post is read by the people who think they run the country. The
National Enquirer is read by the people who think Elvis is alive and running
the country ..."
		-- Robert J Woodhead


On 20/01/2017 09:21, Llorente Santos Jesus wrote:
> Hi Mark,
>
> Did you flush the conntrack? Perhaps what you are seeing are some already established connections prior to setting the rule in iptables?
> Try with "conntrack -D" to remove the connections.
>
> Best,
> Jesus
>
> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Mark Coetser
> Sent: 20 January 2017 08:25
> To: netfilter@vger.kernel.org
> Subject: intermittent nat issue
>
> Hi All
>
> kernel 3.16.0-4-686-pae
> iptables 1.4.21-2+b1
>
> I have a few different firewalls that are exhibiting the same issue
>
> basic rule iptables -t nat -I POSTROUTING -o $external_iface -j MASQUERADE
>
> when running tcpdump on $external_iface I am seeing SOME packets from the private_network not being masqueraded/natted.
>
> --
> Thank you,
>
> Mark Adrian Coetser
> mark@pkfnet.co.za
>
> "Help save the world!"              -- Larry Wall in README
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in the body of a message to majordomo@vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html
> ���{.n�+�������+%�����ݶ��w��{.n�+���z��׫�)���w*jg��������ݢj����G���������j:+v���w�j�m��������w�����f���h������٥
>
