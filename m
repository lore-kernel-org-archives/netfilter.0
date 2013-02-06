From: Francesco <francesco@bsod.eu>
Subject: Re: How to use TPROXY with 2 lan interfaces and one wan
Date: Wed, 06 Feb 2013 14:39:32 +0100
Message-ID: <f5be014b32dd1de84bce075e2761053d@bsod.eu>
References: <bc1efe8ab3ae9b4a050915eeb4d8454e@bsod.eu>
 <5112511B.9020007@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5112511B.9020007@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter@vger.kernel.org

Il 2013-02-06 13:48 Eliezer Croitoru ha scritto:
> On 02/06/2013 12:54 PM, Francesco wrote:
>>
> I'm not sure you understood how it works.
> Take a look at:
> 
> http://wiki.squid-cache.org/ConfigExamples/UbuntuTproxy4Wccp2#Linux_and_Squid_Configuration
> the divert is a match for a local socket connection which is not
> related to marks and should not be marked in the same way as
> intercepted connection.
> For what have you used CONNTRACK and save mark?
> Lets imagine what you have just written:
> #In order the to start a car turn the switch on
> - if you are entering the car switch on the car.
> - if you are switching the car on then continue to step one...
>
> Does it make sense to me? no.
> (take the example as illustration only and might not fit as BIT to 
> BIT match)

Thanks Eliezer for your prompt response.
You're right, is not very clear to me how the things works.
I'm going to read the doc you posted and tyr to figure out how the 
things really work, since i'm a little bit confused regards routing of 
the package.
Thanks a lot for your advices.
See ya
-- 
:: Francesco ::
Blog.....http://fc1979.blogspot.com
Twit.....http://twitter.com/fcolista
Jabber...francesco@jabber.org
E-Mail...francesco@bsod.eu
AboutMe..http://about.me/fcolista
