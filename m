From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: What is best protection for RDBMS backend of web-server in DMZ
Date: Mon, 23 Aug 2004 11:31:01 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093275061.2040.105.camel@localhost>
References: <1093189392.16081.24.camel@Sewak.Asr.Lan>
	 <1093228616.2025.41.camel@localhost>
	 <1093261565.4341.60.camel@Sewak.Asr.Lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1093261565.4341.60.camel@Sewak.Asr.Lan>
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
To: skpobox@hotpop.com
Cc: netfilter@lists.netfilter.org

On Mon, 2004-08-23 at 07:46, Sanjay Arora wrote:
> On Mon, 2004-08-23 at 08:06, John A. Sullivan III wrote:
> 
> > <snip>
> 
> >   I also take it from your point a shoestring budget
> > that very secure environments such as placing the Web front end, public
> > DB and internal DB all on separate networks is not an option.
> No..I meant that I dont have resources to buy expensive closed source
> licences. The public portion of the DB is small. Also, is restricted to
> new registrations & edits, therefore will not require much resources
> unless my site is very successful in what I mean to do. So I can put a
> Pentium III type machine, on a separate segment with a cross cable or a
> hub and an additional card in web-server maybe or maybe put an
> additional machine as firewall between the two.
> 
> Tell me, does it make a difference if the DB server & the firewall
> protecting it from the DMZ are on the same machine or a different one
> with minimalist setup?
If I understand your question correctly, it depends on how much you want
to spend on both equipment and administrative overhead.  It is clearly
safer if you have separate security devices so that if one security
gateway is compromised, there are still other, uncompromised devices
protecting the rest of the network.  However, this kind of network
compartmentalization creates a lot of administrative overhead.  Every
time a new network is added (growth, merger, acquisition, re-addressing)
or a new service is added (a new server or a new service on an existing
service), there is a change to the security configuration.  This is a
bear with manually configured, order dependent rules but does create the
kind of multi-layered security security analysts recommend and network
engineers say is too expensive :-)  (and yes, there are other important
components to multi-layered security).

The ideal scenario is that the Internet users hit the Web server on the
protected DMZ, the Web server then sends the traffic through the public
firewall to an internal firewall which separates the internal users from
the internal servers from the private backends to the public servers. 
This way, if someone compromises the public web server and manages to
leap to the public DB, they cannot easily get to the internal network. 
It also means that if someone on the inside has been compromised through
a phishing, spam, trojan, flavor of the day malware, that they intruder
now poised on the inside of the network also does not have free access
to all services on either DB - just the access the end user would have
(bad enough but better than giving them telnet or MSRPC to the database
underlying server).

This is the major impetus behind ISCS.  When we can drive the cost of
managing that change down to a reasonable level, one can become more
creative with internal security.  I'll share our recommendations here as
general advice in case you find it helpful.  The recommendation pertain
to Internet, VPN, leased-line WAN and, in some cases, LAN access.

We discuss five different network security models:

0) Level 0 is zero security.  All users on the internal network are
allowed access to all services on all devices on the WAN - certainly not
what you want but the way most WANs and LANs are built.

1) Separate the WANs and Internet into zones with user authentication
based upon IP address.  The LAN is still unprotected but the WAN has
become compartmentalized with a spoofable and easily circumvented form
of user authentication.

2) Separate the servers from the users with an internal firewall with
user authentication via IP address.  The LAN has now been
compartmentalized so that the servers are protected from unauthorized
service access from both LAN and WAN users but the user authentication
is still weak.

3) Separate the WANs and Internet into zones with some form of extended,
out-of-band user authentication (e.g., www.nufw.org) such as X.509 cert,
SecureID token, AD, e-Directory, LDAP or RADIUS credentials.  If IPSec
is used, we have the added advantage of protecting the traffic in
transmission.  ISCS can support extended user authentication for IPSec
users based upon their X.509 cert DN's.

4) Combine 2 and 3, i.e., isolate the servers into separate server farms
and only allow access to the needed services to users based upon some
form of extended user authentication.

In your case, it may be feasible to place the public DB on its own
network using either model 2 or 4.  I'm not sure how much extra security
you gain in this case by making the user DB communicate with the
internal DB via extended user authentication.  On the other hand, such
user authentication would help protect your DB from internally postured
attacks.
> 
> > Given that, I would suggest that you place the Web Server in a firewall
> > protected DMZ which only allows the Internet access needed to run the
> > web application (obviously admins from the internal network will have
> > greater access) and place the DB for the web front end on the private
> > network (preferably in its own firewalled network but that is an extra
> > expense).
> No as said above, I can afford to spare a small machine...I like that
> ;-)
> 
> <snip>

> > We like to do this on the firewall in the ISCS project
> > (http://iscs.sourceforge.net) There, when one configures a server or a
> > resource on that server, one has the option to set the public TTL.  This
> > can be seen in the Resources screen shots on the ISCS web site.  One
> > merely sets the value and ISCS automatically creates the mangle table
> > rules to change the TTL for any packets headed out over the Internet.
> > 
> 
> John, I checked out your isca project...seemed a nice effort, but I
> did not see any download links for alpha/pre-alpha downloads. What
> stage is it in?
Funny you should ask! There should be a pre-alpha release on the site
tomorrow. We had not planned to make one because, as an Integrated
Secure Communications System, it really doesn't become useful until all
the integrated parts have been completed.  But we have had a lot of
requests to play with what is done and it is at the point it is at least
reasonably functional.
> 
> I remember coming across such a software with similar policy oriented,
> lower layer neutral approach. But I think it was already
> released...though dont remember the name..Anyone?
I'd love to know about it.  We really did not want to launch a new
project but could find nothing in either the proprietary (even among the
six-figure priced products) or open source world that does what ISCS
does.  We would prefer to not reinvent the wheel if something else
exists.
> 
> Can anyone suggest some tools for managing multi-stage firewalling and
> snort like sensors for monitoring...something like firewalling each
> server for services it does not provide and the ip ranges it is
> supposed to provide it for...and monitoring the whole thing ;-)
That's exactly our goal.
> 
> I am glad that I use open source...otherwise thinking the cost of
> licences with such an approach would be bankruptive ;-))
> 
> With best regards.
> Sanjay.
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


