From: "Pablo Endres" <epablo@pabloendres.com>
Subject: Re: Problems making ipset RPM
Date: Wed, 13 Aug 2008 12:11:04 +0200
Message-ID: <4dd1211b0808130311j707a0dbfp9d728b736b2d7384@mail.gmail.com>
References: <4dd1211b0808120759y79181780hff56c7d6c1a14fb1@mail.gmail.com>
	 <alpine.LNX.1.10.0808121237310.31275@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0808121237310.31275@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Tue, Aug 12, 2008 at 6:38 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
>
> On Tuesday 2008-08-12 10:59, Pablo Endres wrote:
>>
>>I've been trying unsuccessfully to build an RPM of the ipset
>>extensions (which by the way a really great).
>>
>>The main problem is that I can't manage to do a 2 stage install:
>>install in one temporary directory in order to package.  This is
>>normally done with the DESTDIR variable and it works for the binaries
>>but not for the kernel modules.  I've tried some tricks I found in
>>other RPMs but they don't seam to work: INST_DIR, INST_PATH,
>>0=$(DESTDIR) ....
>
> You can use the Xtables-addons package which carries a mirror of ipset
> alongside in multi-stage compliant fashion (this is however just a side
> effect ;-).
>

Thanks for the tip.. I'll look into it.
I managed to find the variable I was missing through Jozsef (ipset),
so all I needed to do is set the INSTALL_MOD_PATH.

Thanks for your help.
Best regards,
Pablo

-- 
Pablo Endres <epablo@PabloEndres.com>
Web: http://www.PabloEndres.com

"Men are not prisoners of fate, but only prisoners of their own minds."
Franklin D. Roosevelt
