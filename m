From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Query: Can Netfilter inspect xml soap traffic
Date: Tue, 25 Mar 2008 11:42:02 -0500
Message-ID: <47E92B5A.5030903@riverviewtech.net>
References: <47E913B6.4080004@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47E913B6.4080004@tssg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 03/25/08 10:01, william fitzgerald wrote:
> Can Netfilter/iptables inspect xml/soap messages as xml based 
> firewalls do?

Is NetFilter / IPTables capable of inspecting layer 7 traffic, yes. 
However it will probably be much more difficult to do than you might 
think.  I would expect it to be much like trying to write a regular 
expression in assembly verses trying to do it in Perl.  It can be done, 
but...

One thing to keep in mind is that the Layer-7 module only looks at some 
of the packet.  Here is a quote from the website:

"... l7-filter only looks at the first 10 packets or 2kB of each 
connection, whichever is smaller. ..."

> Does the Layer-7 module have enough "smarts" to inspect web service 
> messages.

I don't think the "smarts" you are referring to are (or should be) in 
the Layer-7 module.  Keep in mind that the Layer-7 module is a match 
extension as in does this packet have this data at layer 7.  The logic 
behind what to do with what match(es) and how to chain them together to 
make decisions there on (IMHO) should *NOT* be in the Layer-7 module, 
but rather in how you build your rules.

You will need to take in to account all the variances in the traffic 
that could happen.  When speaking SMTP, I can either HELO or EHLO with 
either a name or an IP.  Thus with in the first few packets you already 
have four different possibilities *IF* I play by the rules.  Your 
pattern will have to be very flexible.

> I am asking in regard to the role of Network Access Control firewalls 
> such as iptables within a dedicated enterprise web service SOA 
> environment.

You may have better luck taking the packet and passing it to user space 
and writing an application layer gateway (a.k.a. ALG) and having the ALG 
do the business logic of the filtering for you.

> I have seen some posts that suggest that firewalls are now obsolete, 
> particularly NACs, in regard to web services (everything is over http 
> hence less effect restrictions).

Firewalls are GREAT at filtering on layer 2 or layer 3 (depending what 
they are designed for.  If you want to filter on a higher layer, you 
need to use something that is designed to filter on that layer.

> However, my opinion is that its not as simple as opening ports 80 and 
> 443 to tunnel SOAP messages.

You don't "just open ports".  You "open ports and send them in to the 
next layer of security".  Layer 3 firewall in front of your ALG and then 
let the ALG deal with what it knows about with out worrying about other 
nasty things.

> For example, I may want to restrict IP ranges, maybe I have some 
> business partners and I only want them accessing the web service. Or 
> maybe I need to control DoS attacks to web services.

A layer 2 or layer 3 filter in front of the ALG will do this wonderfully 
with out the ALG having to know about allowed and / or banned IP 
address(es) and / or range(s).

> I think if iptables has also the ability to deep packet inspect xml 
> messages it then demonstrates that there is still an importance for 
> NAC based firewalls.

You can deep inspect to a point, but not as deep as you may be thinking.

> All pointers to documentation and your comments are welcome.

Reply (on or off list) if you'd like to continue the discussion of the 
business logic.




Grant. . . .
