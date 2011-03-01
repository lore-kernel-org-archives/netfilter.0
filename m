From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: any way to reset all marked connections when using CONNMARK?
Date: Tue, 1 Mar 2011 12:47:59 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102172154430.17369@obet.zrqbmnf.qr>
References: <4D55A927.7060703@genband.com> <1297510935.1770.38.camel@andybev> <4D5AF8CA.8080908@genband.com> <alpine.LNX.2.01.1102152342380.18599@obet.zrqbmnf.qr> <4D5D6FD7.8060104@genband.com> <20110217202456.GF4855@cardinal>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110217202456.GF4855@cardinal>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thursday 2011-02-17 21:24, /dev/rob0 wrote:

>On Thu, Feb 17, 2011 at 12:58:31PM -0600, Chris Friesen wrote:
>> On 02/15/2011 04:42 PM, Jan Engelhardt wrote:
>> > On Tuesday 2011-02-15 23:06, Chris Friesen wrote:
>> 
>> >> For some reason the online man pages for conntrack don't seem to 
>> >> be up to date...they don't have the -U option.  It's listed in 
>> >> the package itself though.
>> > 
>> > What online manpages are you referring to?
>> 
>> The first google result for "man conntrack" is
>> 
>> http://linux.die.net/man/8/conntrack
>> 
>> which appears out of date.  The second google result appears okay.
>
>I think the point was that these online man pages are not provided 
>nor maintained by the Netfilter project, so they're a less reliable 
>source of information than the man page accessed locally.

Not to mention die.net is sourcing some terribly old manpages (their 
iptables.8 is from 1.4.1.1 or older).
