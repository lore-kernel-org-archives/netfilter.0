From: Marco <listaddr@gmail.com>
Subject: Re: conntrackd questions
Date: Wed, 6 Mar 2013 11:54:43 +0100
Message-ID: <CAHPDOiGMZKSeVg6TDEiih3aNm_Hr70+P6AqVEnC1Fad2XyaJdQ@mail.gmail.com>
References: <CAHPDOiHUU+4qXB3iz6_6ZKOBRg8beBL_7SHC8c4zULw1vJ2CnA@mail.gmail.com>
	<20130219195237.GA3208@localhost>
	<CAHPDOiFpF2+F8CTJ_fF26bXaCtTCUMDPV8JtZT-HX+m2u1j3AA@mail.gmail.com>
	<20130221183711.GA6061@localhost>
	<CAHPDOiEvpU1hEKkNJMpUrxJP6Lb=9pKDsEbMjqbr7DWKyZt_Ew@mail.gmail.com>
	<20130225154532.GD20561@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=FufXnP6XCtnat+YFwBwI9/RmHSy84lCpRd/xSmVso30=;
        b=Rh0NNbTwwYto8OaiUjhT/PK7XrT2cYqCT9vGwum+sYLKVftuBCfq5cOj/fP4e+KTH/
         QRfKyfZze51lQzpJPpzWky2GHxaYmJsS5NQlaLp5Fy2W7qUueZ8gzufUwxHWbdUJeDot
         yaKxSGkuO2/Jn37kOZFDxIqKe78rAGp4Pf0ECHVitLVqEjcbyjwOxR+rtlDJBFoFzKhL
         1CpdnEDncYkvbLD+W2ZeAwtodeuTVm2w0VT2nDKBflkLW8s8Z73JUbkXtgfRAi/cK+Jw
         tZqL+LJtMNNfD2jSOJ5xAG+0tFoNWPJMnEUH6mCULIBvxi4n8CbfE1BYlUa5/MUR1a2I
         18pQ==
In-Reply-To: <20130225154532.GD20561@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

2013/2/25 Pablo Neira Ayuso <pablo@netfilter.org>:

> On Fri, Feb 22, 2013 at 11:12:55AM +0100, Marco wrote:
> [...]
>> > In your previous config, assuming you use a 3.x kernel, I saw you did
>> > not enabled TCPWindowTracking On. That allows the new primary to
>> > recover TCP window tracking from the middle.
>>
>> Unfortunately, the system where this will run has a 2.6.32 kernel, so
>> this is not an option for the moment.
>
> I really recommend you to upgrade to some stable branch of 3.x. Many
> relevant updates and fixes went into the ctnetlink code since that
> version you're using.

Ok, I've finally found some time to set this up. Now I'm using kernel
3.7.10, keepalived 1.2.2 and contrack-tools 1.4.0, with
"TCPWindowTracking On". I'm sorry to report that I'm still seeing the
original behavior (ie firewall sends RST to origin server and client
hangs).

> [...]
>> Well, the docs mention window tracking here and there, but (at least
>> to me) it's not clear what that does, and that it's (or could be) the
>> solution to this problem I'm seeing.
>> Furthermore, I found no documentation or explanation of
>> nf_conntrack_tcp_be_liberal on google, neither it is in the sysctl.txt
>> file that documents the /proc/sys/net entries, nor anywhere else.
>
> http://git.kernel.org/?p=linux/kernel/git/davem/net-next.git;a=blob;f=Documentation/networking/nf_conntrack-sysctl.txt;h=70da5086153dbd24a9c9258e73cc16440d247519;hb=HEAD

Thanks! Hopefully at some point it will be published in some place
where search engines can find it (the obvious place seems to be
https://www.kernel.org/doc/Documentation/networking/, where it still
isn't visible)..
