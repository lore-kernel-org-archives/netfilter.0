From: Carlos Ble <carlosble@terra.es>
Subject: Re: Problems with firewall and emule
Date: Thu, 3 Apr 2003 00:19:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304030019.37637.carlosble@terra.es>
References: <200304021705.07896.carlosble@terra.es> <200304021549.26475.netfilter@newkirk.us> <200304022356.03782.carlosble@terra.es>
Reply-To: carlosble@terra.es
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304022356.03782.carlosble@terra.es>
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
To: netfilter@lists.netfilter.org
Cc: netfilter@newkirk.us

On Wednesday 02 April 2003 23:56, you wrote:
> On Wednesday 02 April 2003 21:49, Joel Newkirk wrote:
> > On Wednesday 02 April 2003 11:05 am, Carlos Ble wrote:
> > > Hi all. Some users from my lan complains to me about emule.
> > > They have a LOWID and can't use their machines as emule servers.
> > > I had checked my firewall and i think all its ok. I went to
> > > http://www.thedonkeynetwork.com/connection_test
> > > from one computer of the lan to test my conection (using even port 80)
> > > and i got a time out message "time out, this means that even did not
> > > receibe a RESET signal; maybe due to a stealth firewal". But.... the
> > > http port is open because iam browsing !!!.  Needs emule a special
> > > conntrack ?. I dont know so much about emule, can somebody help me
> > > please? Thanks in advance.
> >
> > EDonkey2000 (emule is a 3rd-party replacement for EDonkey, as is
> > MLDonkey) communicates primarily on TCP 4662.  The problem you are
> > facing is that when they connect to a server somewhere, that server will
> > attempt to connect back to them at port 4662, initiating a NEW
> > connection.  This means connecting to the public IP they appear to be
> > at, and if you are masquerading several emule/edonkey users then they
> > all have the same public IP.  Any attempt from outside to connect to one
> > of these machines as a peer or a server will necessarily be a NEW
> > connection, so conntrack cannot know which local machine is the
> > destination.  If only one machine is running, you could DNAT incoming
> > connections from the internet for tcp dport 4662 to that specific client
> > and they would get a HighID.
> >
> > (From a page I'm writing on IM and P2P netfilter issues)
> >
> > TCP 4661 - connect to server
> > TCP 4662 - connect to client
> > TCP 4663 - connect remote GUI to client
> > UDP 4665 - connect to secondary server
> >
> > The only critical port here for incoming connections is 4662, unless they
> > are /really/ running an EDonkey server, in which case they need 4661
> > incoming as well.  For 'normal' p2p file sharing with EDonkey (emule)
> > the client needs 4661 and 4662 outbound, and 4662 inbound.
> >
> > The upshot is that I believe you will only be able to have a single
> > emule/edonkey machine behind a single public IP.  Try adding:
> > iptables -t nat -A PREROUTING -p tcp --dport 4662 -j DNAT --to {ip}
> > for one of the emule users, and make sure you ACCEPT that traffic in
> > FORWARD.  That user should now get a HighID, and favorable searches and
> > transfers.  It is possible that this will allow the others to get
> > HighID's as well, but only the one that is the target of the DNAT would
> > be able to actually serve files, since external queries would never
> > reach the others.  I'm not certain if the extra machines would even be
> > able to receive files, I don't know the EDonkey/Overnet (Overnet is a
> > newer completely 'serverless' variant, communicating on TCP port 4662
> > and an additional random [or manually configured] UDP port) protocols
> > well enough to know if that comes through as a NEW connection or simply
> > a reply to one initiated by the internal client.  I suspect that only
> > the DNAT targetted machine would work properly.
> >
> > Finally, if you really want to accomodate these users, you can set up a
> > specific machine as the EDonkey server, running the Linux EDonkey client
> > software, DNAT outside connections to that machine, and allow each of
> > them remote GUI access to that client.  They would each have knowledge
> > of and control over each other's transfers, however, which might be
> > undesirable to them...  ;^)
> >
> > j
>
> Thank you very very much.Im very grateful with your answer.
> I really had though that there is only one public ip for all lan users, but
> i didn't know the way in what edonkey works.
> I think the best solution is to install a edonkey server but i have more
> problems because from the lan to the internet there are two linux boxes
> (double masquerade) that makes diferent things. One for radius and other
> things and other to load balancing, dns server, squid ...
> Finally, i think lan users gonna keep with lowid status :(
> I'll try to use only one linux box but its so dificult and maybe so heavy
> for the kernel to support all the jobs.


upss . wait a moment :).
lets call linux_box1, the machine in front of the lan, and 
lets call linux_box2 the internet gateway.
Do you think that maybe installing the edonkey client/server in the
linux_box1 and making DNAT in the linux_box2, lan users will get
a high id? 
Can you give me some urls with information about edonkey 
linux client/server , please ?

