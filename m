From: Morgan Read <mstuff@read.org.nz>
Subject: Re: IP redirect?
Date: Thu, 23 Oct 2008 22:51:38 +1300
Message-ID: <4900492A.1050101@read.org.nz>
References: <48FC5095.5040202@read.org.nz> <48FCB064.1020907@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48FCB064.1020907@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Below:

On 21/10/08 05:23, Grant Taylor wrote:
> On 10/20/08 04:34, Morgan Read wrote:
>> To redirect lan traffic addressed to the wan IP (e.g.) 123.456.789.012
>> to the lan IP address 192.168.1.123, I'm using the following:
>> $ iptables -t nat -I PREROUTING 1 -d 123.456.789.012 -j DNAT
>> --to-destination 192.168.1.123
>>
>> But, all internal traffic seems to get lost - 18 months ago when I
>> last did this, traffic to 123.456.789.012 seemed to hit 192.168.1.123
>> and come back without problem.
> 
> Please search the mailing list archives for the "TCP Triangle".  The
> most recent thread was "routing all HTTP requests to my own web server".
>  Also, take a look at one of Julian's images
> "http://jengelh.hopto.org/images/dnat-mistake.png" for more information.

OK, thank you

> 
>> I've added the following, with some interesting results:
>> $ iptables -t nat -I POSTROUTING 1 -s 192.168.1.40 -j SNAT --to-source
>> 58.28.20.69
> 
> *nod*
> 
>> Now, the traffic from the specific lan IP 192.168.1.123 does seem to
>> be redirected correctly and come back to itself.  But still, all other
>> lan traffic seems to get lost.
> 
> This is as I would expect.
> 
>> Any ideas what's happening, where I'm getting lost?
> 
> You are only SNATing traffic from (-s) 192.168.1.40.  Try SNATing all
> traffic from your local LAN that is being redirected to your system.
> 
> $ iptables -t nat -I POSTROUTING 1 -s 192.168.1.0/24 -d 192.168.1.123 -j
> SNAT --to-source 58.28.20.69

Thank you, it works - any ideas why why the DNAT worked on it's own with
out the SNAT 18 months ago?  Or is that a silly question...

Many thanks,
M.
-- 
Getting errors: "There are problems with the signature" (or similar)?
Update your system by installing certificates from CAcert Inc, see here:
http://wiki.cacert.org/wiki/BrowserClients?#head-259758ec5ba51c5205cfb179cf60e0b54d9e378b
Or, if Internet Explorer is your default browser, simply click this link:
http://www.cacert.org/index.php?id=17

Morgan Read
NEW ZEALAND
<mailto:mstuffATreadDOTorgDOTnz>

fedora & freedom; fact || fiction?
http://fedoraproject.org/wiki/Overview
get freed-ora!
http://www.fsfla.org/svnwiki/selibre/linux-libre/freed-ora
