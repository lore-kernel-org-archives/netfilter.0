From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: moving old ips to new ips..forwarding
Date: Fri, 5 Jul 2002 15:40:52 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207051440.g65Eex802164@vulcan.rissington.net>
References: <Pine.LNX.4.21.0207051355420.5181-100000@grabak.talker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.21.0207051355420.5181-100000@grabak.talker.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Friday 05 July 2002 3:25 pm, Cygnus - Flirttown Coder wrote:

> On Fri, 5 Jul 2002, Antony Stone wrote:
> > On Friday 05 July 2002 2:27 pm, Cygnus - Flirttown Coder wrote:
> > > Scenario:
> > > X number of clients (with 1 or more ips bound to a box)
> > > behind Cisco Catalysts, behind Cisco 3600, behind Internet
> > >
> > > Problem:
> > > We want to move clients off our non-portable IP range and onto our arin
> > > range.
> >
> > Why ?   This sounds less secure, less portable, more expensive and less
> > future-proof to me.
>
> because our current bandwidth provider is killing us on our T3 charges,
> and we can't move if our clients are on a non-portable IP range from them.

Okay.   Now that I understand your meaning of the word 'clients', my 
objections no longer stand :-)

> > If you NAT them in one direction, they must be NATted in the other
> > direction as well.   Machines WILL get extremely upset if they contact IP
> > a.b.c.d and then get a reply from IP w.x.y.z (ie it simply won't work).
>
> that presents quite a problem. short of changing each customer's gateway
> from the router to the forwarder. and even so, if the forwarder was
> routing outbound traffic for a customer server (and, what, NATing it to
> say the source ip is the old ip instead?) how does it know that the
> inbound request that came in that's being responded to is from an old ip
> or new ip?

> For example:
>  * server has ip of x.x.x.x, DNS resolves to this, outside services
>    connect to this, etc..
>  * server changes ip from x.x.x.x to y.y.y.y
>  * forwarder routes INBOUND x.x.x.x to y.y.y.y
>  * by your info, forwarder must also route OUTBOUND for requests to
>    x.x.x.x, changing OUTBOUND source ip to x.x.x.x (to correlate IP
>    request was sent to, with, IP answer came from)
>  * now, after DNS and other people outside update IP info, connections
>    comes into the customer server for y.y.y.y, BUT, OUTBOUND traffic is
>    still going to 'forwarder', when is changing the source IP to the old
>    one. so requests from came into y.y.y.y and going out with answers
>    labeled as x.x.x.x

Don't worry about this.   Netfilter will sort it all out for you.

The address translation works like this:

iptables -A PREROUTING -d a.b.c.d -j DNAT --to w.x.y.z

ie any packets addressed to a.b.c.d are changed so that they go to w.x.y.z 
instead.

It is vital that you ensure that the return packets from w.x.y.z to the 
outside world go back through the NAT system, because when they do, the 
source address of the replies will get automagically changed from w.x.y.z to 
a.b.c.d (no additonal rules needed - don't even try to put any in because it 
will make a mess).

However, any paackets which are really addressed to w.x.y.z, even if they go 
through the iptables NAT machine, will not get translated on the way in 
(because they do not match "-d a.b.c.d") therefore the return packets will 
not get translated on the way out.

Hence a network client on the Internet which contacts a server on a.b.c.d 
will actually be contacting a server on w.x.y.z but will continue to get 
replies from a.b.c.d; however a network client on the Internet which contacts 
w.x.y.z will get a reply from w.x.y.z and all will be well.

Hope this helps.

By the way, what bandwidth is your Internet link ?   Don't you think it would 
be a good idea to put an actual firewall in the link so that you can at least 
provide some filtering on the system ?

 

Antony.

