From: Jason Opperisano <opie@817west.com>
Subject: Re: new connections
Date: Sun, 06 Feb 2005 14:15:47 -0500
Message-ID: <1107717347.4679.14.camel@hubcap.ljm.dom>
References: <200502060520.25538.ramoni@databras.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200502060520.25538.ramoni@databras.com.br>
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
To: netfilter@lists.netfilter.org

On Sun, 2005-02-06 at 02:20, Ramoni wrote:
> People...
> What do you all think about make rules for new connections only ?
> Make all rules for new connections (--syn) and let the -m state --state 
> ESTABLISHED care about connectuions you have allowed ?

that's exactly how i build every firewall.

> I' ll aplly a poatch on my firewall to support the raw table, to use the 
> NOTRACK targe for cionnections that I does not need to track (and ensure a 
> connection response) for example:
> A connection from outside to my webserver, will always come from random port 
> to port 80 of my server, and the response will be from port80 to any port 
> outsdie.
> 
> Whats the really need to track this ? I can make rules allowing these and just 
> make connectinio tracking for connections from inside to outside that I wont 
> make rules expecting the response.

um--the point of bypassing connection tracking with the use of NOTRACK
is that the overhead of connection tracking adds unacceptable latency to
the connection.  i have seen this used (and used it myself) for
high-load DNS servers.  since almost every DNS resolution request is one
packet request, one packet response; there is a noticeable delay between
using connection tracking over NOTRACK.  i suppose the same argument
could be made for a very high traffic web server that gets lots of
short-lived requests for tiny amounts of data.

-j

--
"I am so smart, I am so smart, s-m-r-t....I mean s-m-A-r-t."
	--The Simpsons


