From: "Christoph Galuschka" <christoph.galuschka@tikom.at>
Subject: Re: Trying to set up NAT
Date: Fri, 01 Apr 2005 17:50:00 +0200
Message-ID: <424D89C8.13559.11842C33@localhost>
References: <424D8057.28845.115F4D28@localhost>
Reply-To: christoph.galuschka@tikom.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <20050402013459.70a072a9.harold.a.burchey@uts.edu.au>
Content-description: Mail message body
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

Hello,

well to clear some things up.
A short drawing of the setup:

|			      |
|-----------------------------------|     10.1.1.0/24
|	|	|	      |
	|	|
       |-------|  |-------|
       |  P    |  |   W  |
       |-------|  |-------|

P is 10.1.1.1; W is 10.1.1.2

TCP-packets coming from the 10.1.1.0-net going to P on port 
15000 should end up at W port 80. IMHO the relevent line for 
this is:
iptables -t nat PREROUTING -d 10.1.1.1 --dport 15000 -j 
DNAT --to-destination 10.1.1.2:80

tcpdump also shows me some packets ariving on port 15000 
but nothing more.

thanks and regards
Christoph

Am 2 Apr 2005 um 1:34, schrieb Harold Burchey:

> On Fri, 01 Apr 2005 17:09:43 +0200
> Christoph Galuschka <christoph.galuschka@tikom.at> wrote:
> 
> > ie: A connection to the proxy (10.1.1.1) on port 15000 
should 
> > go to another machine (10.1.1.2) on port 80 via the proxy.
> 
> I recently set up my DNAT. There was one 'gotcha' that 
certainly got me.
> >From the symptoms you're describing you may be having 
the same problem.
> Basically when you use DNAT to forward packets, be sure 
that your
> firewall is also configured to pass them.
> 
> A lot of websites recommend a simple firewall which drops 
all packets
> that aren't related or established, but these are the exact 
packets
> which need to be passed if you have a server behind your 
firewall and
> want to pass new connections to it.
> 
> Here are a couple of lines of code that might help:
> 
> iptables -t nat -A PREROUTING -p tcp --dport 15000 -j 
DNAT --to-destination 10.1.1.2:80
> iptables -A FORWARD -p tcp --dport 80 -j ACCEPT 
> 
> On the other hand, I'm only taking a stab in the dark here. If 
you
> posted the relevent snippets of code you may get more 
useful responses.


