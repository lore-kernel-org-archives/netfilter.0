From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Query: Can Netfilter inspect xml soap traffic
Date: Tue, 25 Mar 2008 12:33:22 -0500
Message-ID: <47E93762.4040107@riverviewtech.net>
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
> Thus, the ideal firewall configuration is one that is aligned with the 
> application supported by the system, that is, it permits valid 
> application traffic, and, preferably, no more and no less.

Not directly related to your question(s), but still appropriate.

I would like to see developers write their applications with 
documentation (be it auto generated or not) that indicates what type of 
traffic (and parameters there on) they expect to see and need to 
function correctly.  I'd like to then take said documentation and use it 
to build rules for a simple ALG that will pass any valid requests in to 
the back end application while correctly handling erroneous traffic.  I 
think said ALGs could easily function as a proxy with some simple rules 
as to what is and is not allowed to pass through the ALG.

The next step is to educate the ALG about traffic flow from resource to 
resource (read:  page to page) and define how to handle improper traffic 
flow.  If someone tries to jump further in, should we go to an error 
page, or should we send them back to the start page?

I think these types of ALGs would significantly reduce the security 
problems with these types of applications.  Or at least if there was an 
SQL injection vulnerability in a given back end, it could be filtered by 
an ALG by simply checking for valid characters in a particular object 
property.  The ALG could either scrub (remove) the object property or it 
could fall back to an errant condition and redirect elsewhere, or it 
could conditionally do both depending on the previous history of the 
client.  Say for example if you or I accidentally enter an inappropriate 
character in a string and get redirected back to the form to correct the 
error verses an SQL injection script trying different things against the 
page.

These are the types of things that ALGs can do that is very difficult to 
implement in the back end code.



Grant. . . .
