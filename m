From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: need for stateful packet inspection
Date: Thu, 27 May 2004 20:06:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085702814.2093.22.camel@grendel>
References: <40B126AA.3050106@qwest.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40B126AA.3050106@qwest.net>
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
To: Randolph Jones <jonesrf1@qwest.net>
Cc: netfilter <netfilter@lists.netfilter.org>

On Sun, 2004-05-23 at 18:33, Randolph Jones wrote:
>
> I am considering buying a linksys router. It seems to have statefull 
> packet inspection that blocks nonmatching incoming packets.

Stateful inspection is implemented on a per application basis, so
support for SI may mean that FTP gets inspected but not Telnet, DNS,
etc., etc.

Stateful packet filtering is implemented on a per transport basis, so
TCP and UDP may be handled but not ICMP, GRE, AH, etc., etc.

So you need to look a bit more closely at the device beyond whether it
supports SI or not. You have to see where it has been implemented.

> If I do not have a server exposed to the internet, do I need any
> packet inspection other than checking that all incoming packets match an 
> earlier outgoing request?

And the answer is.... "it depends". ;-)

FTP tends to "break" if you are not inspecting the payload and looking
for the port negotiations. Many devices get around this by only
supporting passive mode, but that requires you to open up all upper
ports. This is a great way to ensure that call home Trojans can get out
as well. Same is true for other complex protocols such as DCOM, Real
Audio, etc. etc. 

Also, you need SI to handle ICMP errors correctly. Type 3's and type
11's seem to be the covert channel of choice these days as many
firewalls let them blow right though. 

So if the Linksys supports all of the above, you are cool. If it does
not but you don't care about any of the above, you are cool as well.
Otherwise, you may want to look into getting something more robust.

I have no idea what the Linksys looks like these days. I know a few
years back it was trivial to use loose source route to communicate with
hosts on the protected side of the device. You may want to test this.

HTH,
Chris



