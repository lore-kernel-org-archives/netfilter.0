From: "Filip Sneppe (Cronos)" <filip.sneppe@cronos.be>
Subject: Re: Overriding REDIRECT for certain hosts (SQUID)
Date: 24 Nov 2002 21:19:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038169142.698.44.camel@exile>
References: <20021123052657.30417.33449.Mailman@kashyyyk> 
	<1038066385.4859.12.camel@rbhome>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1038066385.4859.12.camel@rbhome>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Ryan Beisner <ryanb@thedataarc.com>
Cc: netfilter@lists.netfilter.org

On Sat, 2002-11-23 at 16:46, Ryan Beisner wrote:
> 
> I don't know if anyone else has noticed, but SQUID doesn't treat some
> websites very kindly in its http acceleration (transparent proxy). 
> Mainly, Microsoft Outlook Webmail (I have a client using it).
> 
> [ BTW this is a strange breed of a web based mail system .. it looks
> like you're using Outlook, within a webpage, released by MS.  Their
> firewall info claims that HTTP is the only protocol in use. ]
> 

Hi Ryan,

The reason is that MS Exchange 2000 OWA will by default use the 
WebDAV http extension between Internet Explorer (MS refers to this
as a "Rich" client) and the web server. With any other browser 
(MS calls these "Reach clients"), OWA will use basic HTTP without
the flashy GUI.

WebDAV is what makes OWA look like Outlook, with drag and drop 
features e.a.
"Sharepoint Portal Server", another one of their products, also
uses WebDAV.

Now, WebDAV through a proxy like Squid wouldn't be such a big problem
if it wasn't for the extensions that MS built into their version
of the WebDAV protocol ("embrace and extend", anyone ?). Basically,
there are some keywords in their version of the protocol that are
not standard (yet ?). (The situation may have changed - I don't know
how far WebDAV has been standardized yet)

However, it should be easy to remedy your problem. As reported on this
site:

http://www.webdav.org/other/proxy.html

It is possible for from Squid 2.4 onwards to add request methods to
squid via the "extension_methods" configuration directive.

For OWA (~ MS WebDAV) to work, you will at least have to add these
request methods:

BMOVE
BDELETE
BPROPFIND
SEARCH

at the time, one of my colleagues from our Exchange team got all the
"extra" WebDAV commands from an MS engineer - I think those four
cover the extensions. "SEARCH" was really an important one, I think.

Now, at the time (squid 2.4STABLE2), I hadn't heard of the 
"extension_methods" directive, so I looked into the squid 
mailing list archives. There I found an answer from one of
the Squid developers (I think Henrik) that explained how to
add request methods by adding them to some arrays of constants
in src/url.c and src/enums.h. Check the Squid mailing list archives
if you want to find out the details. I recompiled Squid 2.4STABLE2
with this but never got to see if it worked because the client
I was doing this for had already dropped the OWA "rich" functionality
because of memory leak/stability problems on Exchange :-)
It is possible to turn the WebDAV crap off via a registry fix on
the Exchange, iirc.

However, I don't think it's needed to patch the source code anymore
now that there's a "extension_methods" directive.

Better yet, from peeking at the code of Squid-2.5STABLE1, I think
all the important request methods are already in these, like
"SEARCH", "BMOVE", etc.
So basically, with a recent Squid, it should work. What version
of Squid is doing the reverse proxying ?

One other possiblity is that MS has added yet another batch of
WebDAV extensions with an Exchange Service Pack release. In that
case, you will have to dig out a network sniffer and see what 
methods a client is using when he's logging on to OWA....


Wheww, long explanation of something not really netfilter related :-)
Out of curiosity, if someone knows if it's possible to teach Apache
new http request methods ? It would be necessary if one wants to use
Apache as a (reverse) proxy of OWA traffic...

Regards,
Filip










