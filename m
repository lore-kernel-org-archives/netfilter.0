From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: No ICMP connections in /proc/net/ip_conntrack?
Date: Sat, 12 Feb 2005 10:11:43 -0500
Message-ID: <200502121011.43894.Alistair@nerdnet.ca>
References: <7bca1cb5050211094730ec3a1a@mail.gmail.com>
	<20050211184546.GA3617@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050211184546.GA3617@bender.817west.com>
Content-Disposition: inline
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

On February 11, 2005 01:45 pm, Jason Opperisano wrote:
> On Fri, Feb 11, 2005 at 11:47:37AM -0600, Asim Shankar wrote:
> > However, if I "ping D" from A and B, then no entry seems to be present
> > in ip_conntrack. My understanding based on:
> > http://www.faqs.org/docs/iptables/icmpconnections.html is that I
> > should see something in ip_conntrack.
> >
> > Am I missing something?
>
> yeah--you're just not that fast.  a conntrack entry is created when the
> ICMP Echo-Request is received and removed when the Echo-Reply goes out.
> the total elapsed time that the conntrack entry exists would be in the
> very low millisecond range...and i don't think your cat is that fast.
>
> -j
	I can assure you Jason, my cat isn't that fast, in fact right now he's 
horizontal, on his back, purring up a storm... I doubt he'd be able to twitch 
a whisker in time.

	Alistair.
>
> --
> "Silly customer, you cannot hurt a Twinkie!"
>         --The Simpsons

