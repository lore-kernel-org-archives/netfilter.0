From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Thu, 20 Jun 2002 15:15:27 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206201415.g5KEFYU32741@vulcan.rissington.net>
References: <0B2759D401C1D211ACA500805FFE2C3F06367537@cmxserv3.hilton.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <0B2759D401C1D211ACA500805FFE2C3F06367537@cmxserv3.hilton.com>
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
To: netfilter <netfilter@lists.samba.org>

On Thursday 20 June 2002 3:09 pm, Preston Wade wrote:

> If they are different ports could you not just redirect connections for the
> destination ports to the correct box?

You certainly could do this, however I assume that Niall wants to have a 
separate IP address for each of his firewall, web server & mail server.

Of course, there's no reason that has to be the case, though...

Antony.

> > On Thursday 20 June 2002 2:47 pm, Niall Murphy wrote:
> > > hi all,
> > > I be very gratefully for any help..
> > > my firewall has 2 nic's the external one's ip 194.125.213....  but
> > > behind
> > > the firewall I have a proxy server and an email server with ip's
> > > 192.0.0.106 and 192.0.0.253. I know I need to use DNAT and SNAT to send
> > > internet packets to them but i do not know how to add aliases to  the
> > > eth0
> > > so that i can route packets to my firewall and then DNAT them on...
> > > does any one know how to use this "ip add address" command   ( maybe
> > > even a
> > > example or two)
> >
> > http://defiant.coinet.com/iproute2/quickie-ip.html

