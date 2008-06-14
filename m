From: pud <pud@subnet666.de>
Subject: Re: [ANNOUNCEMENT] ipset-2.3.1 released
Date: Sat, 14 Jun 2008 17:43:53 +0200
Message-ID: <20080614154353.GA24486@safeTpin.homeunix.org>
References: <Pine.LNX.4.64.0806121135040.2250@blackhole.kfki.hu>
Reply-To: pud@subnet666.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0806121135040.2250@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thu, 12 Jun 2008, Jozsef Kadlecsik wrote:

> Hello,
> 
> I'm happy to release a new version of ipset. This is a bugfix release, no 
> new features added. The list of the fixes:

thanks for that, but maybe it still needs a fix for building with glibc-2.8:

cc -O2 -Wall -Wunused -I/usr/src/linux/include -I.  -fPIC -o ipset_iphash.o -c ipset_iphash.c
ipset_iphash.c: In function 'create_parse':
ipset_iphash.c:71: error: 'UINT_MAX' undeclared (first use in this function)
ipset_iphash.c:71: error: (Each undeclared identifier is reported only once
ipset_iphash.c:71: error: for each function it appears in.)
make: *** [ipset_iphash.o] Error 1


including limits.h fixes it of cause, but i'm not sure if that is a proper fix



-- 
gpg-key #C3B04767
