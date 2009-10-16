From: "Roderick Groesbeek" <r.groesbeek@triple-it.nl>
Subject: RE: conntrack generates UDP 'ghost traffic'
Date: Fri, 16 Oct 2009 14:26:26 +0200
Message-ID: <3F6AD08836AD044C935E9FAC3A764742024241FB@pandora.triple.lan>
References: <3F6AD08836AD044C935E9FAC3A764742024241BE@pandora.triple.lan> <1255686963.25297.22.camel@enterprise.ims-firmen.de> <3F6AD08836AD044C935E9FAC3A76474201366842@pandora.triple.lan> <1255692592.21398.15.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <1255692592.21398.15.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

> -----Original Message-----
> From: Thomas Jacob [mailto:jacob@internet24.de]
> 
> AFAIK, these are end to end settings, i.e. they are only
> relevant when your Linux box is the target or source of the connection
> (your NAT box isn't). So if you want to use TCP keepalive,
> you'd need to tune Tiss or the Android device.
> 
> If you want to tune the NAT/conntrack/netfilter behavior, you
> need to fiddle around with these settings:
> 
> find /proc/sys/net | fgrep netfilter
> 
> Dunno of a nice place where those are documented in detail,
> maybe someone else on the list can chime in.

Thomas,
How 'scary' do you think it would be to set this on say: 75 seconds?

[root@pollux net ]# cat
/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_established
432000
[root@pollux net ]#

And is this setting operational 'both ways' (too the masqued connection
and the internal connection)?

> 
> Don't know much about RTP (H323?) but also check
> out the module options
> 
> "modinfo nf_conntrack_h323"
> 
> maybe they can help you.
> 

Know all about RTP/RTCP/RTSP/etc.

We build H.323 applications too! :)
We even sell H.324m gateways, and build them for Tandberg (now Cisco):
http://www.triple-it.nl/wp-content/uploads/2009/03/factsheet_gateway.pdf

It does look like that NF_CONNTRACK modules for H.323 and RTSP are still
pretty much unmaintained for Linux.

For instance:
I had to patch & build the RTSP conntrack module for our pollux, it
didn't worked out of the box.

--
Vriendelijke Groet,

Roderick
--
TRIPLE IT
straat://Keesomstraat 10e
postcode://1821 BS
plaats://Alkmaar                                         
tel://+31(0)72-5129516
fax://+31(0)72-5129520                             
http://www.triple-it.nl  "Laat uw Net Werken!"
