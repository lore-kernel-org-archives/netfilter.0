From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Multiple Netmeeting Sessions
Date: Sun, 25 Apr 2004 15:57:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404251557.18229.Alistair@nerdnet.ca>
References: <408BE248.4030302@rd.arkonnetworks.com> <200404251826.38016.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404251826.38016.Antony@Soft-Solutions.co.uk>
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

On April 25, 2004 01:26 pm, Antony Stone wrote:
> On Sunday 25 April 2004 5:07 pm, Norman Zhang wrote:
> > Hi,
> >
> > I was wondering if it is possible to setup iptables to allow multiple
> > Netmeeting sessions originated from internet to local net? So far I map
> > the port in /etc/shorewall/rules
> >
> > DNAT net loc:10.0.0.10 tcp 1720
> > DNAT net loc:10.0.0.10 tcp 1503
> >
> > But it only goes to a single machine? Or do I need gateway for this?
>
	I believe that you need to also forward other ports for netmeeting.
	port 389, and 522 need to be forwarded through.  Although, with
	this setup I believe you can only connect to one machine inside.

	I'm not sure what frontend those rule are for, but they both appear to be 
	forwarded to the same machine.  Thus the connections will always go 
	there.

	The problem in this case is that there is a specific port on which the 
	call is initiated, and the machine to which you forward 1520 will recieve all
	inbound calls.

	If you have many 'recievers' inside the firewall that have non-routable 
addressess you will want to look into h323 gatekeeper software, or look into 
having different primary ports for each 'recieving' host i.e 10.0.0.10:1520
	10.0.0.11:1521 10..0.0.12:1522 --> I know this can be done with gnomemeeting, 
	but I am unsure if MS netmeeting can be configured to recieve calls on ports 
	*other* than 1520.

	There are two h323gatekeeper packages that I'm aware of, 

	http://www.gnugk.org/
	http://www.equival.com/phonepatch  <-- I haven't been able to get there 
	recently -- anyone know if equivalence is titsup, or is this just bad 
	routing/networking in their neck of the woods?

	of course, as Antony points out --->

> I believe you need H.323 helper modules for netmeeting.   Patch-O-Matic
> should have these.

	You definately need these to get the connections through.	
>
> Regards,
>
> Antony.

