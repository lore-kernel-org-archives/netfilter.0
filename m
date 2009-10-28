From: Jeff Jensen <jjensen@unyalli.com>
Subject: Re: explanation of the syslog LEN and WINDOW entries
Date: Wed, 28 Oct 2009 09:21:49 -0600
Message-ID: <b376a78e0910280821u179357del5c93069706391461@mail.gmail.com>
References: <b376a78e0910280653y6312fc63yb2d20414d76a1ce0@mail.gmail.com>
	 <56378e320910280720q79cd3dma8eee31f3512a6c0@mail.gmail.com>
	 <b376a78e0910280756h4ba10f1oea023c6b870fe0cb@mail.gmail.com>
	 <56378e320910280811t48e13264nb8992e2be9492f1a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56378e320910280811t48e13264nb8992e2be9492f1a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Horton <richard.horton@solstans.co.uk>, netfilter@vger.kernel.org

So for TCP do I add all the LEN fields only?

If I have a thousand log entries and all the LEN fields are 60 did I
use 60,000 bit's?

Or is it Bytes?

In UDP do I add both LEN fields?



On Wed, Oct 28, 2009 at 9:11 AM, Richard Horton
<richard.horton@solstans.co.uk> wrote:
>
>
> 2009/10/28 Jeff Jensen <jjensen@unyalli.com>
>>
>> Thanks Richard, So there is no parameter (or combination of
>> parameters) in the syslog entry stating actual packet size?
>>
>> Hmmmm????
>>
>> The boss wants to know how much bandwidth is used by the different
>> app's we allow. I have some unique app's that run on unique port(s)
>> and rules that log all packets. I set the --log-prefix= to something
>> unique to that app and every day sort it out into individual files. I
>> was hoping to aggregate all the entries to a total bandwidth out and
>> it.
>
>
> For estimating individual application usage they'll be fine, was thinking
> more along not using the len fields for estimating total consumed bandwidth
> (as IP tables only deals with ip traffic and so will miss other forms of
> traffic, ipx, appletalk, arp etc)
>
>
