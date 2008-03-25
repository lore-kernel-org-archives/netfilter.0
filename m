From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Query: Can Netfilter inspect xml soap traffic
Date: Tue, 25 Mar 2008 12:25:11 -0500
Message-ID: <47E93577.9090408@riverviewtech.net>
References: <47E913B6.4080004@tssg.org> <47E92B5A.5030903@riverviewtech.net> <47E93099.9010602@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47E93099.9010602@tssg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 03/25/08 12:04, william fitzgerald wrote:
> Thank you Grant for your speedy reply.

*nod*

> My argument is that it appears to me that (secure) Enterprise Web 
> Service applications, particularly those involving access control, are 
> typically focused at the application-domain only, rather than taking a 
> more holistic approach to also include the underlying infrastructure 
> (for example, firewalls). As a result, infrastructure configurations may 
> unintentionally hinder and prohibit the normal operation of the Web 
> Service.

Possibly...

> Thus, the ideal firewall configuration is one that is aligned with the 
> application supported by the system, that is, it permits valid 
> application traffic, and, preferably, no more and no less.

*nod*

> What I presume is that Web Service developers assume the underlying 
> infrastructure is magically available. Also there seems to be a tendency 
> to tunnel (for example SOAP) over http or https.

Agreed...

>  From this point of view, Semantic Web developers may form the opinion 
> that firewalls are redundant as they typically have ports 80 and 443 
> accessible (and forward traffic to specialized user-space programs for 
> further packet processing). Maybe they are correct! Have you any comments?

I think people forget that firewalls are filtering 65,533 other ports 
for TCP as well as other protocols too.  The firewalls filter out other 
cruft (if you will) so that developers are free to concentrate on what 
they know, the web app, with out worrying about the rest of the cruft.

I also think a firewall should go so far as to filter out all traffic to 
the web server ports that is not valid, i.e. various types of attacks 
and things that are in an invalid date.  These are the types of things 
that firewalls are *VERY GOOD* at doing that are much harder to do on a 
higher layer.  I would much rather let an IPTables firewall or a Cisco 
PIX (or what ever you would like) filter out invalid TCP traffic 
*BEFORE* it gets to the web server.  This will (should) at least 
(significantly) reduce the exposure of the web server to malicious 
packets that may other wise hinder normal operation.

> In my opinion, deploying a network level firewall  (such as Linux 
> Netfilter) provisioned for Enterprise Web Services is not simply about 
> opening port 80 on the server for all traffic; one may wish to deny 
> certain nodes (IP addresses, etc.), only accept HTTP traffic from some 
> nodes, require other nodes to use HTTPS and also deal with HTTP traffic 
> that is tunneled through proxies available on other ports.

I think you need to look at things in layers (not related to OSI).
  - Have the first layer do your basic allow / deny based on source IP.
  - Have your next layer do basic protocol validation as well as SPI.
  - Have your next layer do some filtering of content and take action as 
necessary.
     - This may be a form of proxy or front end web server that will 
pass traffic on to the back end or redirect people to different URLs.
  - Have the back end do a more thorough analysis and subsequent 
processing of traffic.

> While low level infrastructure such as firewalls may not solve all 
> security issues ( as good as an application based XML firewall would) in 
> regard to Web Service applications, I believe they have a role to play 
> in applying the belt-and-braces approach to security best practices.

If you directly pass *ALL* TCP port 80 traffic in to an XML firewall, 
you are exposing the firewall to a lot more than it would other wise be 
exposed to.  Most ALGs also take more processing overhead to do their 
filtering.  Thus having the ALG do the filtering for all traffic will 
incur more processing over head than having the firewall filter some of 
the traffic thus reducing the amount of traffic that the ALG has to 
process thus reducing the processing resources consumed by the ALG.

> What I am really looking for is some concrete documents, publications, 
> administrator experience that helps support my gut feelings of the role 
> of Network Access Controls (NAC's) within an enterprise SOA environment.

Good luck finding that.

> If anyone feels I should resubmit this email under another heading for 
> example:
> "Is Netfilter obsolete in an Enterprise Web Service Environment" please 
> let me know.

I don't think you should re-word the subject as such.  Your question(s) 
are more along the lines of whether or not a simple layer 2 / layer 3 
firewall still has any place in the current B2B market, not whether or 
not NetFilter / IPTables is obsolete or not.  Focus on the real 
question(s) and problem(s).

> Looking forward to comments on this, albeit tomorrow before I can reply 
> again.

*nod*



Grant. . . .
