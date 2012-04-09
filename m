From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: NAT Reflection on Gateway with DHCP Address
Date: Sun, 8 Apr 2012 21:31:14 -0500
Message-ID: <20120409023114.GV3502@harrier.slackbuilds.org>
References: <CAEH2fGxT9-F48ZT5zTm4HFY2U6ywZXxGKSXMwEaM1oRO2gK6Hw@mail.gmail.com>
 <20120409010844.GT3502@harrier.slackbuilds.org>
 <034990BB-E6AA-495C-A990-23279E5077B6@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <034990BB-E6AA-495C-A990-23279E5077B6@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sun, Apr 08, 2012 at 06:42:51PM -0700, Aaron Clausen wrote:
> On 2012-04-08, at 6:08 PM, /dev/rob0 <rob0@gmx.co.uk> wrote:
> > On Sun, Apr 08, 2012 at 05:10:19PM -0700, Aaron Clausen wrote:
> >> I'm trying to sort out how to do NAT reflection off the public 
> >> interface where that interface's IP address is supplied via DHCP 
> >> from the ISP. Any thoughts?
> > 
> > I would guess that by "NAT reflection", you mean that you think 
> > you want to NAT internal clients to an internal host for various 
> > requests of your external name. This only makes sense if you are 
> > using some kind of dynamic DNS service to give you an "external 
> > name".
> 
> And this works fine except for some devices which ignore my DNS and 
> use external ones like Google's and thus fail when trying to access 
> our public resources from our internal WiFi network.

So reconfigure those devices to use your internal DNS. Why are such 
devices needing to contact you by your external hostname? Have them 
use an internal hostname and nameserver.

BTW dnsmasq is not just a nameserver, it is also a DHCP server. You 
might want to have your devices use DHCP, thus giving centralized
control over such matters.

Getting back on topic, you can also hijack their DNS queries ...

iptables -vt nat -A PREROUTING -i wlan0 -p udp --dport 53 -j REDIRECT
iptables -vt nat -A PREROUTING -i wlan0 -p tcp --dport 53 -j REDIRECT

> Hence the need of reflection/loop back/whatever-you-call-it.

And I gave you two links to tell you how to do that.
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
