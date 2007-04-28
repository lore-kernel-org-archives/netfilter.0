From: Kirk Wallace <kwallace@wallacecompany.com>
Subject: Wireless Login Page
Date: Sat, 28 Apr 2007 11:43:27 -0700
Message-ID: <1177785807.3828.227.camel@ws1.walco02.com>
References: <1177772620.3828.176.camel@ws1.walco02.com>
	<46338845.1020605@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46338845.1020605@lopsch.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Sat, 2007-04-28 at 19:45 +0200, Daniel Lopes wrote:
> Kirk Wallace schrieb:
> > (This may be a duplicate message, KW)
> > 
> > Thank you for the replies Alex and Jan.
> > 
> > I set up a test system with two PC's. PC one has Apache httpd running on
> > it with iptables flushed, defaults set to accept all packets and is at
> > 192.168.21.1 . PC two is simply a workstation at 192.168.21.10 . I can
> > get my default webpage by pointing the workstation's browser to
> > 192.168.21.1 . I invoked "iptables -t nat -A PREROUTING -p TCP --dport
> > 80 -j REDIRECT" on the http host. At this point I was expecting to point
> > the workstation's browser to 192.168.21.2 and get the default webpage,
> > but this returned "Unable to Connect".
> > 
> 
> Hi,
> 
> I don't really understand what you are trying. When your browser 
> connects to 192.168.21.2 and there is no webserver running it will not 
> be able to connect logically. Do you want to redirect traffic destined 
> to 192.168.21.1 to 192.168.21.2 then -j DNAT --to-destination 
> 192.168.21.2 is your friend not -j REDIRECT. This will redirect all 
> traffic to the local machine.

On Sat, 2007-04-28 at 18:32 +0100, Alex wrote: 
> TBH this site can explain -j REDIRECT better than I could.
> http://security.maruhn.com/iptables-tutorial/x10065.html
> 
> Is the machine thats doing the NATing the same as the one with the httpd? 
> This has to be the case for redirect to work as you require it. Other wise, 
> maybe you could use squid to proxy?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I was using 192.168.21.2 just to test whether httpd would respond to any
IP address sent on the 192.168.21.0/24 address space. 

I envision that a person would boot their wireless laptop and scan for
hotspots. They would see my hotspot and connect. Then my DHCP server
would give the laptop an IP address, subnet mask, gateway address, DNS1
and DNS2. Then the user would start firefox and try to open a link to
anywhere.com, but I have FORWARD denied to all but logged in users
(which have a tunnel IP address on another subnet). At this point, I
want the anywhere.com request to invoke the httpd on the wireless router
to reply with a login page. Currently dhcpd, httpd, radiusd and pptpd
are on the same PC.

I was looking at Chillispot to do this but it doesn't have some of the
features I want, and I could not find documentation that would allow me
to figure out how it works. I want an application that does just what it
needs to do, that I can understand and modify as my needs change.

I have used REDIRECT to allow a pcAnywhere connection to an internal PC
from the Internet, and I still get a kick that it works, but I was able
to get it to work without fully understanding how it works. (Does that
make me a script kiddie?)

Basic List question: 

I am used to reading a message from a list, then clicking the reply
button, typing a reply and clicking send, which sends the reply back to
the list. It seems here, that I need to cut and paste the message
history and reply to a new message addressed to the list address. Is
this the proper way to use this list?

Kirk


