From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Documentation (was Re: randomly changing IPs from different subnets
 (Google Mail))
Date: Wed, 23 Jun 2010 13:34:38 -0500
Message-ID: <4C2253BE.5060909@riverviewtech.net>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr> <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com> <4C210C24.9050605@gmail.com> <DC83A9D5-A181-42B0-9FED-13EB46F2D24A@gmail.com> <4C21F56C.3070603@gmail.com> <alpine.LSU.2.01.1006231354010.14260@obet.zrqbmnf.qr> <4C22105A.70006@gmail.com> <20100623141213.GR19868@cardinal> <4C221BF0.40609@gmail.com> <20100623151345.GT19868@cardinal> <alpine.LSU.2.01.1006231737590.13675@obet.zrqbmnf.qr> <4C223308.8010307@gmail.com> <alpine.LSU.2.01.1006231828300.21618@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1006231828300.21618@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/23/10 11:36, Jan Engelhardt wrote:
>> What should be used as the base format * for the 'originals' from now on?
> 
> My preference are LyX documents with a CC-BY-SA license.

My vote would be fore DocBook (or some other XML based format).

Conversions there from are almost automatic.  I.e. get the new base, 
pass it through the converters and there you go.

With DocBook, it's trivial to have your XSLT add SSI includes for 
headers and footers to integrate directly in to a web site.  Further, 
DocBook will produce HTML that uses styles for formatting, thus allowing 
consistent theming in a web site.

> I am in the process of collecting "interesting" questions on these 
> mailing lists to build chapters.

DocBook also supports sub-dividing things in to chapters and separate 
documents too.



Grant. . . .
