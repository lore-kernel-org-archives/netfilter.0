From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: NAT Reflection on Gateway with DHCP Address
Date: Sun, 8 Apr 2012 20:08:44 -0500
Message-ID: <20120409010844.GT3502@harrier.slackbuilds.org>
References: <CAEH2fGxT9-F48ZT5zTm4HFY2U6ywZXxGKSXMwEaM1oRO2gK6Hw@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEH2fGxT9-F48ZT5zTm4HFY2U6ywZXxGKSXMwEaM1oRO2gK6Hw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sun, Apr 08, 2012 at 05:10:19PM -0700, Aaron Clausen wrote:
> I'm trying to sort out how to do NAT reflection off the public 
> interface where that interface's IP address is supplied via DHCP 
> from the ISP. Any thoughts?

I would guess that by "NAT reflection", you mean that you think you 
want to NAT internal clients to an internal host for various requests 
of your external name. This only makes sense if you are using some
kind of dynamic DNS service to give you an "external name".

"NAT reflection" is not really a standard term. A clueless but more 
common term for the same thing (this term being employed in some 
consumer-grade router devices) is "loopback NAT". That term is 
clueless because "loopback" is indeed a standard networking term, and 
"loopback NAT" has nothing to do with loopback interfaces.

All that said: the best idea is to handle this in DNS. You run your 
own nameserver for internal hosts, and give them the internal IP 
address when they query for the external name. I highly recommend 
dnsmasq(8) for this job; it is provided by most common GNU/Linux 
distros.

http://thekelleys.org.uk/dnsmasq/doc.html

An advantage to this approach over "NAT reflection" is that your 
logging contains useful information. With "NAT reflection", all 
connections to the external name from internal hosts would show as 
coming from the router.

The only drawback isn't really a drawback, and that is that for any 
given external name, you can only resolve it to one [set of] internal 
IP address[es]. With NAT you can have HTTP on 10.0.0.80, FTP on 
10.0.0.21, IMAP on 10.0.0.143, et c. Solution: use different names 
for different services. If it costs you anything to add more names, 
you need a better DNS provider.

Your answer to the original question requires an understanding of 
source and destination NAT. A graphical representation of the issue 
of same-subnet NAT can be seen here:
    http://jengelh.medozas.de/images/dnat-mistake.png

A detailed explanation of the matter is here:
    http://www.frozentux.net/iptables-tutorial/chunkyhtml/x4033.html
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
