From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: a dos?
Date: Mon, 26 Aug 2013 18:13:42 -0700
Message-ID: <521BFD46.7020203@mailinator.com>
References: <521BF007.4040907@mailinator.com> <Pine.LNX.4.61.1308262032410.17328@soloth.lewis.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.1308262032410.17328@soloth.lewis.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

08/26/2013 05:35 PM, Jon Lewis wrote:
> On Mon, 26 Aug 2013, Mike Wright wrote:
>
>> Hi all,
>>
>> Don't know if this is the appropriate place to ask so if not please
>> just ignore.
>>
>> There is some unexplained, non-stop traffic that won't go away.
>>
>> 27.50.2.191:80 keeps calling me at 63.192.15.229:4460.
>>
>> tcpdump shows 2 types of Flags: [S.] and [.], each one's packet
>> numbers never change.  Almost all of the packets are type 1.
>

Thanks for your help.

> The [S.] is likely step 2 of the 3-way handshake in making a TCP
> connection.  If you're not sending syns to 27.50.2.191:80, then perhaps
> someone else is, either as an attack against 27.50.2.191, or because
> they're using your IP space (likely on a private network) and have leaky
> NAT.
>
>> Something puzzling was that the source IP may be related to the
>> DEBOGON Project?
>
> Why do you think that?
>

 From their whois info:

route:          27.50.0.0/22
descr:          APNIC debogon project testing

