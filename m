From: Martin <mylists@itcom.com.ar>
Subject: Re: ip_conntrack files
Date: Wed, 14 May 2008 18:58:41 -0300
Message-ID: <1210802321.23968.41.camel@kr0sty.1.com.ar>
References: <1210768892.2956.476.camel@kr0sty.1.com.ar>
	 <935fab200805141401k7aadcbeci65f2c830dda74b14@mail.gmail.com>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <935fab200805141401k7aadcbeci65f2c830dda74b14@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave <finalglide@gmail.com>
Cc: netfilter@vger.kernel.org


On Wed, 2008-05-14 at 14:01 -0700, Dave wrote:
> Hi Martin, I went down this road as well.
> 
> The source files seem to be included in the latest Patchomatic
> sources. Did you check this site?
> http://www.intra2net.com/de/produkte/opensource/ipt_account/
> 
> The POM will patch your kernel sources with the ACCOUNT tool, this
> part worked flawlessly.
> 
> The source to add to the POM util is here if the files are not in your
> POM already.
> http://www.intra2net.com/de/produkte/opensource/ipt_account/pom-ng-ipt_ACCOUNT-1.12.tgz
> 
> I actually tried to compile the userspace tools for ACCOUNT but it
> always failed, so I never got to use it.  Maybe you will have better
> luck, please let us know if you are successful getting it up and
> running.
> 
> Good luck
> -Dave

Thanks for the response Dave.

May be I didn't explain my problem very well, sorry I must improve my
english :S

I need ip_conntrack (core and some patchs like ftp and amanda), and
ip_connlimit, but looks like I can't find them.

I've downloaded POM, runed "./runme download" for extra packages, then
"./runme extra", but ip_conntrack and ip_connlimit aren't there, all
I've found are nf_conntrack and so.

Am I missing something? I just can't find the way to install them on a
2.6.25 vanilla kernel...


Thanks again for your help

cheers

Martin

