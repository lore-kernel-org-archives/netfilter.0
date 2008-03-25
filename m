From: william fitzgerald <wfitzgerald@tssg.org>
Subject: Re: Query: Can Netfilter inspect xml soap traffic
Date: Tue, 25 Mar 2008 17:04:25 +0000
Message-ID: <47E93099.9010602@tssg.org>
References: <47E913B6.4080004@tssg.org> <47E92B5A.5030903@riverviewtech.net>
Reply-To: wfitzgerald@tssg.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47E92B5A.5030903@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Thank you Grant for your speedy reply.

My argument is that it appears to me that (secure) Enterprise Web 
Service applications, particularly those involving access control, are 
typically focused at the application-domain only, rather than taking a 
more holistic approach to also include the underlying infrastructure 
(for example, firewalls). As a result, infrastructure configurations may 
unintentionally hinder and prohibit the normal operation of the Web Service.

Thus, the ideal firewall configuration is one that is aligned with the 
application supported by the system, that is, it permits valid 
application traffic, and, preferably, no more and no less.

What I presume is that Web Service developers assume the underlying 
infrastructure is magically available. Also there seems to be a tendency 
to tunnel (for example SOAP) over http or https.

 From this point of view, Semantic Web developers may form the opinion 
that firewalls are redundant as they typically have ports 80 and 443 
accessible (and forward traffic to specialized user-space programs for 
further packet processing). Maybe they are correct! Have you any comments?

In my opinion, deploying a network level firewall  (such as Linux 
Netfilter) provisioned for Enterprise Web Services is not simply about 
opening port 80 on the server for all traffic; one may wish to deny 
certain nodes (IP addresses, etc.), only accept HTTP traffic from some 
nodes, require other nodes to use HTTPS and also deal with HTTP traffic 
that is tunneled through proxies available on other ports.

While low level infrastructure such as firewalls may not solve all 
security issues ( as good as an application based XML firewall would) in 
regard to Web Service applications, I believe they have a role to play 
in applying the belt-and-braces approach to security best practices.

What I am really looking for is some concrete documents, publications, 
administrator experience that helps support my gut feelings of the role 
of Network Access Controls (NAC's) within an enterprise SOA environment.

If anyone feels I should resubmit this email under another heading for 
example:
"Is Netfilter obsolete in an Enterprise Web Service Environment" please 
let me know.

Looking forward to comments on this, albeit tomorrow before I can reply 
again.

regards,
Will.


Grant Taylor wrote:
> On 03/25/08 10:01, william fitzgerald wrote:
>> Can Netfilter/iptables inspect xml/soap messages as xml based 
>> firewalls do?
> 
> Is NetFilter / IPTables capable of inspecting layer 7 traffic, yes. 
> However it will probably be much more difficult to do than you might 
> think.  I would expect it to be much like trying to write a regular 
> expression in assembly verses trying to do it in Perl.  It can be done, 
> but...
> 
> One thing to keep in mind is that the Layer-7 module only looks at some 
> of the packet.  Here is a quote from the website:
> 
> "... l7-filter only looks at the first 10 packets or 2kB of each 
> connection, whichever is smaller. ..."
> 
>> Does the Layer-7 module have enough "smarts" to inspect web service 
>> messages.
> 
> I don't think the "smarts" you are referring to are (or should be) in 
> the Layer-7 module.  Keep in mind that the Layer-7 module is a match 
> extension as in does this packet have this data at layer 7.  The logic 
> behind what to do with what match(es) and how to chain them together to 
> make decisions there on (IMHO) should *NOT* be in the Layer-7 module, 
> but rather in how you build your rules.
> 
> You will need to take in to account all the variances in the traffic 
> that could happen.  When speaking SMTP, I can either HELO or EHLO with 
> either a name or an IP.  Thus with in the first few packets you already 
> have four different possibilities *IF* I play by the rules.  Your 
> pattern will have to be very flexible.
> 
>> I am asking in regard to the role of Network Access Control firewalls 
>> such as iptables within a dedicated enterprise web service SOA 
>> environment.
> 
> You may have better luck taking the packet and passing it to user space 
> and writing an application layer gateway (a.k.a. ALG) and having the ALG 
> do the business logic of the filtering for you.
> 
>> I have seen some posts that suggest that firewalls are now obsolete, 
>> particularly NACs, in regard to web services (everything is over http 
>> hence less effect restrictions).
> 
> Firewalls are GREAT at filtering on layer 2 or layer 3 (depending what 
> they are designed for.  If you want to filter on a higher layer, you 
> need to use something that is designed to filter on that layer.
> 
>> However, my opinion is that its not as simple as opening ports 80 and 
>> 443 to tunnel SOAP messages.
> 
> You don't "just open ports".  You "open ports and send them in to the 
> next layer of security".  Layer 3 firewall in front of your ALG and then 
> let the ALG deal with what it knows about with out worrying about other 
> nasty things.
> 
>> For example, I may want to restrict IP ranges, maybe I have some 
>> business partners and I only want them accessing the web service. Or 
>> maybe I need to control DoS attacks to web services.
> 
> A layer 2 or layer 3 filter in front of the ALG will do this wonderfully 
> with out the ALG having to know about allowed and / or banned IP 
> address(es) and / or range(s).
> 
>> I think if iptables has also the ability to deep packet inspect xml 
>> messages it then demonstrates that there is still an importance for 
>> NAC based firewalls.
> 
> You can deep inspect to a point, but not as deep as you may be thinking.
> 
>> All pointers to documentation and your comments are welcome.
> 
> Reply (on or off list) if you'd like to continue the discussion of the 
> business logic.
> 
> 
> 
> 
> Grant. . . .
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
William M. Fitzgerald,
PhD Student,
Telecommunications Software & Systems Group,
ArcLabs Research and Innovation Centre,
Waterford Institute of Technology,
WIT West Campus,
Carriganore,
Waterford.
Office Ph: +353 51 302937
Mobile Ph: +353 87 9527083
Web: www.williamfitzgerald.org
      www.linkedin.com/in/williamfitzgerald
      www.ryze.com/go/wfitzgerald



