From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: irc
Date: Mon, 17 Nov 2003 19:00:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311171900.21550.Alistair@nerdnet.ca>
References: <OF3489540F.204A1A44-ON85256DE1.0071CE7C-85256DE1.0072EC94@kal.kalsec.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF3489540F.204A1A44-ON85256DE1.0071CE7C-85256DE1.0072EC94@kal.kalsec.com>
Content-Disposition: inline
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
To: trainier@kalsec.com, netfilter@lists.netfilter.org

On November 17, 2003 03:55 pm, trainier@kalsec.com wrote:
> The ident thing is partially true.  EFnet (the network I use), does claim
> to require ident.  If you actually look though, it initiates the
> connection, before it sends out it's ident request.

	At least two of the UnderNet servers deny connections without
	ident.... and several misconfigured private servers for ISPs do the 
	same ... *sigh* (leastways far as I've been able to track my 
	*cough* households usage....)

>
> I am not concerned at all with dcc.  dcc was a huge mistake and should've
> never been implemented into irc.
> I am, however, interested in the nat irc handlers.  Where do I get them
> and how do I use them? What're they for?
>
> Regards,
>
> Tim

	They facilitate the DCC connections... 
	I've never had problems with basic connections to IRC servers
	without the NAT handler .. .the iptables NATting and 
	ESTABLISHED,RELATED rules handle server connections 
	just fine.  DCC initiates  a *new* connection inside packets across
	 the initial connection: iptables irc modules can peek inside these
	packets and setup the connection to the other end of the DCC request
	 (thus Direct Client to Client), this connection is NOT to the server and 
	has to be tracked separately from the initial server connection.
	the ip_nat_irc and ip_conntrack_irc modules in iptables manage this
	rather well.... And apparently we've fixed the problem that was caused
	by some clients trying to outsmart NAT by using the outside ip at the 
	client in the most recent iptables release and POM.  (way to go developers)

	(if you had set your client to use the ip address that the IRC server saw,
	ip_nat_irc and ip_conntrack_irc would label DCC connections as 
	'forged dcc requests' since they already had the natted address in the
	packet ... instead of the unnatted address)

>
>
>
>
> Antony Stone <Antony@Soft-Solutions.co.uk>
> Sent by: netfilter-admin@lists.netfilter.org
> 11/17/2003 03:05 PM
>
>
>         To:     netfilter@lists.netfilter.org
>         cc:
>         Subject:        Re: irc
>
> On Monday 17 November 2003 7:56 pm, Alistair Tonner wrote:
> >                If you've several systems that want to connect and do DCC
>
> you
>
> >                will want to make sure you load the conntrack and nat irc
> >                handlers from iptables ... they aren't needed for plain
>
> connections,
>
> >                but are for DCC sends/recieves.
>
> Indeed, however I assumed that anyone interested in the security of having
> a
> firewall wouldn't be using insecure things like DCC.   However, your
> reminder
> that there is a conntrack helper for this protocol is a good one.
>
> >                As a rule these days a LOT of irc servers want an identd
>
> reply ...
>
> >                identd is a horrible security problem, but you can use
>
> several
>
> >                alternatives ... I've a python script that acts as a
>
> chrooted identd
>
> >                server -- works a charm replying with random numbers ....
>
> You mean they actually require an identd response before allowing a
> connection (rather than just making it take a bit longer than usual)?
>
> What's the point in that?   It adds nothing to security, adds very little
> to
> logging opportunities, and only interferes with people trying to keep
> their
> networks to themselves.
>
> Ho Hum; it's a strange world on the Internet....
>
	Indeeeeeeeed it is..... *cough* wintendo *cough* skiddies included.
	(sorry ... i'm sitebanning a bunch of morons from a mush right now.)


> Antony.

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

