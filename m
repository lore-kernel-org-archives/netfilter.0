From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Modem to Ethernet Bridge
Date: Thu, 5 Sep 2002 11:30:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020905153012.GH7289@cannon.eng.us.uu.net>
References: <F37GuSKqGABtvNLepTy000017d8@hotmail.com> <200209051442.g85EgNv00719@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200209051442.g85EgNv00719@vulcan.rissington.net>
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
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

I don't see why a natted solution is required here. It's all basic
routing. Assuming all the hosts in the lan (192.168.0.0/24) have a
default route to 192.168.0.25 and the ppp host at 192.168.1.2 has
a default route to 192.168.1.1, then the linux box must be able to
forward packets back and forth between these two subnets.

You say that you can ping the lan from the client and vice-versa
which means that this basic setup is already in place. The reason
that you are not able to do ftp might be due to some filtering
which is going on on the linux box. Turn off the firewalling features
on the linux box and you'll be good to go for the routed protocols.

As for the windows network browsing, if I'm not wrong this does use
some netbios crap which is not routed meaning you need to bridge between
the ppp and the lan. In theory it is possible but I've not done the
bridging between a ppp link and an ethernet network and don't know
whether the linux bridging code suports that. You yourself can test
this ppp/ethernet bridging and see what happens and let us know.

Ramin

> > I have a box with a network card(LAN) ip 192.168.0.25 subnet 192.168.0.0/24
> > and has a modem for dial-in access which allocates 192.168.1.1 on this side
> > and 192.168.1.2 to the client.
> >
> > I am able to ping the LAN from the client and vice-versa and am able to
> > http browse etc but I am not able to ftp, windows network browse etc.
> >
> > Does anyone have any pointers on where to start? I simply want the dial-in
> > client to be treated as safe and to have full access to the LAN.
> 
> SNAT the packets from 192.168.1.2 behind the 192.168.0.25 address.   Then 
> other machines will be able to reply to your dial-in user (provided they can 
> already reply to your box with the two interface as described above).
> 
> Something like:
> 
> iptables -A POSTROUTING -t nat -s 192.168.1.2 -j SNAT --to 192.168.0.25
> 
> should do the trick.
> 
> Antony.
> 
> -- 
> 
> If you want to be happy for an hour, get drunk.
> If you want to be happy for a year, get married.
> If you want to be happy for a lifetime, get a garden.

