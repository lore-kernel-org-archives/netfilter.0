From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: dual homed problem.
Date: Mon, 17 Jun 2002 15:42:41 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020617194241.GG22025@cannon.eng.us.uu.net>
References: <20020614182532.43867.qmail@web13903.mail.yahoo.com> <20020617193513.50501.qmail@web13904.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020617193513.50501.qmail@web13904.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: Carlos Lopez <chlopezl@yahoo.com>
Cc: netfilter@lists.samba.org, raymondl@knowledgefactory.co.za

Can you elaborate as to what's not working?

0) What does tcpdump/etherreal say on the internal
   interface?

1) Without the DNAT rule and with the alias, can you
   ping that IP, from outside of course?

2) If yes, could it be that you're sending the reply
   packets out through eth1 and the ISP does some
   anti-spoofing stuff?

Ramin

On Mon, Jun 17, 2002 at 12:35:13PM -0700, Carlos Lopez wrote:

> Do i need the alias ip to make the DNAT?
> Is ok what I'm doing? if so, why it doesn't work?
> pls help.
> 
> Carlos Lopez
> 
> --- Carlos Lopez <chlopezl@yahoo.com> wrote:
> > Hi all,
> > I'm working on a dual homed configuration. I have a
> > firewall that makes the routing.
> > the configurations is as follows:
> > 
> > public-ip-eth0 --\
> >                   FIREWALL ----> private-ip-eth2
> > public-ip-eth1 --/
> > 
> > I want to be able to have access to a server with a
> > private ip throughout a public ip and DNAT.
> > I understand that DNAT has session management so I
> > did
> > as follows:
> > 
> > on the firewall I configured public ips as aliases
> > ie:
> > ifconfig eth1:0 200.62.53.226 netmask
> > 255.255.255.240
> > 
> > then added in the firewall the following line:
> > iptables -A PREROUTING -t nat -d 200.62.53.226 -j
> > DNAT --to 172.28.16.4
> > 
> > is there something wrong?
> > Why it doesn't work?
> > 
> > thanks in advance,
> > Carlos L?pez.
> > 
> 
> 
> 
> __________________________________________________
> Do You Yahoo!?
> Yahoo! - Official partner of 2002 FIFA World Cup
> http://fifaworldcup.yahoo.com

