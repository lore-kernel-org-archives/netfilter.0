From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Wed, 23 Jun 2010 09:12:13 -0500
Message-ID: <20100623141213.GR19868@cardinal>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr> <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com> <4C210C24.9050605@gmail.com> <DC83A9D5-A181-42B0-9FED-13EB46F2D24A@gmail.com> <4C21F56C.3070603@gmail.com> <alpine.LSU.2.01.1006231354010.14260@obet.zrqbmnf.qr> <4C22105A.70006@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4C22105A.70006@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Wed, Jun 23, 2010 at 04:47:06PM +0300, Lars Nooden wrote:
> Am 23.06.2010 um 14:54 schrieb Jan Engelhardt:
>> Do not start grepping in iptables -L.
>
> There is also building iptables rules with a script and re-run
> that as an option.

Scripts are not recommended because of the possibility of race 
conditions. iptables-restore(8) changes rulesets atomically.

>> That is what iptables -S and iptables-save are much better suited 
>> for.
>
> Perhaps the manual pages are out of date then.  There appears to be 
> no mention of the option -S in the manual page for iptables v1.2.10 
> or on this web page:
>
> 	http://linux.die.net/man/8/iptables
>
> % iptables -S
> iptables v1.2.10: Unknown arg `-S'
> Try `iptables -h' or 'iptables --help' for more information.

http://www.netfilter.org/news.html :

"2004-Jun-15
	New iptables 1.2.10 release ..."

That was SIX YEARS ago.

> Where are you finding -S ?

What is out of date is your version of iptables and that Web page. 
Manuals for recent releases of iptables are up-to-date.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
