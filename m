From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: patch-o-matic compile
Date: Wed, 2 Apr 2003 01:32:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030402013205.28c21c48.arnt@c2i.net>
References: <20030401193849.239665a9.arnt@c2i.net>
	<ABEKJILKOKKGGDJKHKDFOEHFCAAA.patrick@vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ABEKJILKOKKGGDJKHKDFOEHFCAAA.patrick@vikus.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Patrick Ahler <patrick@vikus.com>
Cc: netfilter@lists.netfilter.org

On Tue, 1 Apr 2003 17:02:46 -0500, 
"Patrick Ahler" <patrick@vikus.com> wrote in message 
<ABEKJILKOKKGGDJKHKDFOEHFCAAA.patrick@vikus.com>:

> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Arnt Karlsen
> Sent: Tuesday, April 01, 2003 12:39 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: patch-o-matic compile
> > 
> > 
> > On Tue, 1 Apr 2003 11:35:24 -0500, 
> > "Patrick Ahler" <patrick@vikus.com> wrote in message 
> > <ABEKJILKOKKGGDJKHKDFKEHCCAAA.patrick@vikus.com>:
> > 
> > > Hi, I just patched my kernel for h323 and string. Now it says that
> > > I'm ready to compile. Being a bit of a linux newbie, only been
> > > using since august, I'm a bit confused on what to do next. If
> > > someone could give some kind of specific step by step procedure
> > > that'd be great. I've re-compiled once before, but had problems.
> > 
> > ..cd back home to your kernel tree, read the README.  You may want 
> > to edit the Makefile to name your new custom kernel, to, say, 
> > 2.4.20-telefon-pom or somesuch and to drop your new kernel home 
> > into /boot.
> > 
> > ..I prefer to use an old .config and run 'make oldconfig', 
> > or start from scratch with 'make menuconfig', then 'make dep',
> > 'make modules', 'make modules_install', and then 'make install'.
> 
> 
> when I do a "make oldconfig" I get an error saying ... 
> 
> make: *** No rule to make target 'oldconfig'. Stop.
> 

..no error, feature; from /usr/src/linux/README:

 - Alternate configuration commands are:
     "make menuconfig"  Text based color menus, radiolists & dialogs.
     "make xconfig"     X windows based configuration tool.
     "make oldconfig"   Default all questions based on the contents of  
                         your existing ./.config file.

..and lets keep the discussion _on_ the list, off-list offers 
opportunities to lure people into do _dumb_ things.

 
> > ..to simplify matters, a new and intuitive programming language
> > interface is gaining momentum over at the FlightGear(.org), see
> > http://seneca.me.umn.edu/pipermail/flightgear-devel/2003-April/016690.html
> > 


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



