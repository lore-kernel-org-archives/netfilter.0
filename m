From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: bridging with iptables (was no subject)
Date: Fri, 28 Jun 2002 23:29:48 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020628222950.JIAL295.mta03-svc.ntlworld.com@there>
References: <000901c1000a$8aaa63e0$4d2848c7@shaggy> <20020628200048.TETZ19225.mta07-svc.ntlworld.com@there> <0GYF00FO1SU6ML@l-daemon>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <0GYF00FO1SU6ML@l-daemon>
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

On Friday 28 June 2002 11:22 pm, Jack Bowling wrote:

> Nothing to add. Just changed the subject line to something useful for the
> archives and search engines.

Good idea.

In which case.... can anyone here give some advice on combining netfilter 
with a bridge (which, as Patrick kindly pointed out) doesn't have an IP 
address on *either* (any?) of its interfaces ?

ie does the standard Linux routing system, and the various netfilter hooks, 
still work sensibly enough to be able to put netfilter rules onto a bridge ?

Or is netfilter based so much around routing concepts and interfaces with 
addresses on them that it doesn't really work properly ?


I'm sure I'll find a use for a bridge one day, so it'd be good to know 
whether I can put netfilter on it when I do.

 

Antony.

 
> > On Friday 28 June 2002 9:02 pm, Patrick Schaaf wrote:
> > > Hi Antony,
> > >
> > > > Hmmm.   I thought a bridge was supposed to have the same address on
> > > > both interfaces.   Still, I've never set one up myself, so maybe
> > > > there's more than one way to do it.
> > >
> > > A bridge, by its nature, has no IP addresses at all. The original
> > > poster is asking about a pure router.
> >
> > Ugh.   In that case I recommend using IPs from two *different* network
> > ranges on the two sides of the machine !
> >
> > > And you are right on spot with your observation about the ability of a
> > > malicious user to fake her MAC address at will. And one nice thing
> > > about most wireless networks is that I can just listen to the air for
> > > some time to learn what MAC/IP combination it is that I should fake
> > > after it became silent...
> >
> > Indeed.   There may be anti-sniffing measures available for wired
> > networks, but I know of nothing which can detect / defeat sniffing on
> > wireless.
> >
> >
> >
> > Antony.

