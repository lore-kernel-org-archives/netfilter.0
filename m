From: Garison Piatt <todo@garisonpiatt.com>
Subject: Re: I have no idea why this doesn't work...(further details)
Date: Thu, 22 Apr 2004 11:53:16 -1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.0.20040422115305.02ae04e0@mail.garisonpiatt.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

At 09:57 PM 4/22/04 +0100, Antony Stone wrote:
>On Thursday 22 April 2004 9:10 pm, Garison Piatt wrote:
> > this was cobbled together from scripts that were said to work in
> > other places, and my assumption was that these were common port numbers.
>I'm reminded of the phrase "a little bit of knowledge can be a dangerous
>thing".  :)

I'm reminded of that on an hourly basis.  :)


> > As far as I know: one server, everything on the same machine,
>
>1. I assume the server is not the same machine running netfilter?   (ie: you
>are trying to set up a routing firewall, not create rules on a machine to
>protect itself?)

No, just the opposite: one machine, trying to protect itself.  Multiple web 
sites on the machine.  Sorry I wasn't clear.


>2. "One web site client"?   I don't understand.   Surely the server is
>accessible to the entire Internet (although maybe not...)?

Perhaps I should have said, "one client web site".

The server was set up because the ISP won't drop certain email 
restrictions, even though my client brings them *a lot* of business.  (Most 
of her customers want to send voluminous newsletters, but the ISP has a 
limit of 99 emails per hour.)  The eventual intent is to host all of her 
customers (12-15) on one web server.  Currently (by the end of this month), 
we have one customer to move over to this new server.  Within the next two 
months, that should go up to 8.  That's the target arrangement: up to 15 
(and maybe more) web sites hosted on one server, with a single firewall 
protecting all of them.


> > Support calls are $150 a pop, so she wants me to make
> > as few of those (read: zero) as possible.
>Support from whom (where)?   All we're asking is basic network configuration
>stuff - not technical assistance in getting something working.

 From the ISP; they've given out a limited amount of information -- 
basically, just the IP number.  They expect that all user maintenance will 
be done from the command console they provide -- which, they say, does a 
great job of creating and maintaining web sites -- but it doesn't do diddly 
about security.  We're supposed to handle that on our own, by hand.


> > We want to allow TELNET (just from me and her, if possible), all FTP, and
> > web traffic.
>Okay, where are you (in network terms, compared to the firewall and server
>we're talking about), where is she, and where does the web traffic come from?

Not sure what you're asking here.  Everything is outside of the server -- 
me, her, all web visitors, hackers, etc.  I'm assuming the server is on a 
table in Florida somewhere, connected only to the internet.  I'm on a cable 
customer (non-dedicated) line, which I believe means that my IP changes 
every time I log in.  Don't know about my client.


>Telnet is not a recommended protocol - everything is sent in clear text - is
>there any good reason why you are not using ssh?

Didn't know about it.  I just downloaded PuTTY.


>Note that the above rules will *not* give you remote access to the firewall
>itself.   You almost certainly do want this

With all the things I don't know, this one I definitely do: we *do* want 
remote access to the firewall.


Mahalo,
-garison  


