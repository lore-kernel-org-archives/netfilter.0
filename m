From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: IP address to MAC address
Date: Tue, 11 Jun 2002 16:55:43 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020611205543.GC21405@cannon.eng.us.uu.net>
References: <001601c2113a$aa85b560$0500a8c0@escritoriomundial.com.br> <200206111253.g5BCrqU10699@vulcan.rissington.net> <1023827880.4177.81.camel@billy.demon.nl> <200206112040.g5BKetA21075@Networker.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <200206112040.g5BKetA21075@Networker.rockstone.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

On Tue, Jun 11, 2002 at 09:40:53PM +0100, Antony Stone wrote:

> On Tuesday 11 June 2002 9:38 pm, Tony Earnshaw wrote:
> 
> > tir, 2002-06-11 kl. 14:53 skrev Antony Stone:
> 
> > > ping $IP -c1 >/dev/null 2>&1
> > > grep $IP /proc/net/arp | tr -s ' ' | cut -d' ' -f4
> > >
> > > (There's a single space in between each of those pairs of ' ', in case
> > > it's not obvious.)
> >
> > Did you say 'arp -a'?
> 
> I would have done, if I knew I was root, but the commands I suggested work 
> for an unprivileged user too :-)

If that information can be read by anybody then the wrapper program like arp
can be run by anybody as well ;-)

Ramin

> Antony

