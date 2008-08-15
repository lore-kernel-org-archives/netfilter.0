From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: IP gets lost during redirection
Date: Thu, 14 Aug 2008 20:21:25 -0500
Message-ID: <48A4DA15.60603@riverviewtech.net>
References: <g82aqt$kes$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <g82aqt$kes$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 8/14/2008 5:15 PM, John Smith wrote:
> I got a server (first machine) which is reachable via the internet. 
> Depending on kind of Request (HTTP, FTP...) it redirects internally 
> to a different machine. This machine (second machine) is running 
> apache2 for example. Everthing works fine. Yet the apache logs on the 
> second machine always list the redirecting machine (first machine) as 
> the requesting adress/ip and not the ip adress of the requesting 
> client from the internet.

Ok...

What happens if an internal client tries to connect to an ""external 
service?  I.e. the FTP server tries to HTTP to your ""external service? 
  Will the HTTP connection work?  What source IP do you see in Apache's 
logs then?

I'm wondering if the packets are being redirected (as in NATed) or if 
they are being proxied in.  If they are proxied in, you would naturally 
see the internal source IP of the proxying host.

> How can I fix this? I'm sorry to be so unspecific about the 
> configuration of iptables on the redirecting machine, but this is all 
> I know about it. However I can get more information if it is needed 
> for the solution and you can exactly say what you need.

It depends on what is really being done.  Find out if IPTables really is 
being used to do the ""redirecting on the first machine.  If IPTables is 
being used to do the ""redirecting (as opposed to just filtering for a 
proxy) see what the contents of the NAT table is on the first system. 
(The output of iptables-save would be great.)



Grant. . . .
