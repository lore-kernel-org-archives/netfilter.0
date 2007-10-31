From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: redirect to webpage
Date: Wed, 31 Oct 2007 13:34:55 -0500
Message-ID: <4728CACF.70601@riverviewtech.net>
References: <20071031111119.hc54s7z4e80sc0ws@webmail.harrisonburg.k12.va.us>	<4728AF60.4090102@riverviewtech.net> <20071031130209.wnb2jsiao0owc8ok@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071031130209.wnb2jsiao0owc8ok@webmail.harrisonburg.k12.va.us>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/31/07 12:02, dhottinger@harrisonburg.k12.va.us wrote:
> Cool and thanks,
> 
> So something like:  $IPC -t nat -A PREROUTING -d cantbustme.net -j 
> DNAT --to-destination mywebserver.com ?  Where cantbustme is the site 
> I want to redirect and mywebserver is the box with the youve been 
> busted page?

Yes, well sort of.  Keep in mind that IPTables operates on a packet 
level (OSI Layers 2 and / or 3), not the URL level (OSI Layer 7).  Thus 
if you have multiple different web sites all residing on the same 
server, IPTables by default has no way to differentiate packets going to 
one URL over packets going to another URL.  (That is not quite true, you 
could use Layer 7 filtering to do this.)  Also keep in mind that the 
IPTables binary will translate the names to IP addresses at the time the 
command was run.  So if the IP address changes you will need to update 
your rule.  All this being said, yes your rule will catch and DNAT 
(redirect) packets to your server.

A gotcha to keep in mind is that if you redirect internal clients 
traffic back to an internal web server, the internal web server will see 
the traffic as coming from the internal client (purportedly) directly to 
the internal web server and as such reply from the internal web server 
directly to the internal client.  In such cases your internal client 
will see an out going connection to one supposed external server and 
getting this unknown not correctly initiated TCP connection from this 
rude internal web server that needs to be told where to go.  One way to 
work around this is to SNAT the traffic that is being DNATed by your 
firewall to the internal web server such that replies from the web 
server are sent back to the internal firewall which will unSNAT and 
unDNAT the traffic and send it back to the original client in such a way 
that the original client is perfectly happy with the traffic thinking it 
came from the original destination server.

What a lot of people do is configure a proxy server on the firewall and 
configure clients to use it.  Any clients that try to bypass the proxy 
by connecting directly get redirected to the proxy server port that is 
listening in transparent proxy mode.  This way they can force everyone 
to use the proxy.  In short, have the proxy answer normal proxy queries 
on its standard port (Squid uses 3128) and also listen in transparent 
proxy mode on port 80.  This way you only need to use one statement in 
IPTables to redirect (via the REDIRECT target) traffic passing through 
the firewall on port 80 to the local port 80 that is listening in 
transparent proxy mode.

I personally prefer to have clients be aware that they are connecting to 
a proxy server rather than using transparent proxying for everything. 
It is my (possibly misguided) long held belief that talking to a proxy 
as a proxy is better than talking to a proxy as a web server.

The difference between the REDIRECT target and the DNAT target is that 
DNAT will send the traffic any where you tell it to where as REDIRECT 
only alters the destination to be the local IP address of the interface 
the traffic that it comes in on.  Thus when you want to redirect traffic 
to a proxy running on the local system the REDIRECT target will work 
just fine where as when you want to redirect traffic to a proxy running 
on a different system you will need to DNAT and SNAT the traffic.



Grant. . . .
