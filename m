From: "Preston Wade" <Preston_Wade@hilton.com>
Subject: RE: (no subject)
Date: Thu, 20 Jun 2002 09:09:54 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <0B2759D401C1D211ACA500805FFE2C3F06367537@cmxserv3.hilton.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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

If they are different ports could you not just redirect connections for the
destination ports to the correct box?

Thanks,
Preston

> -----Original Message-----
> From:	"Antony Stone" <Antony@Soft-Solutions.co.uk>@INTERNET@HHC 
> Sent:	Thursday, June 20, 2002 8:55 AM
> To:	netfilter
> Subject:	Re: (no subject)
> 
>  <<...>> 
> On Thursday 20 June 2002 2:47 pm, Niall Murphy wrote:
> 
> > hi all,
> > I be very gratefully for any help..
> > my firewall has 2 nic's the external one's ip 194.125.213....  but
> behind
> > the firewall I have a proxy server and an email server with ip's
> > 192.0.0.106 and 192.0.0.253. I know I need to use DNAT and SNAT to send
> > internet packets to them but i do not know how to add aliases to  the
> eth0
> > so that i can route packets to my firewall and then DNAT them on...
> > does any one know how to use this "ip add address" command   ( maybe
> even a
> > example or two)
> 
> http://defiant.coinet.com/iproute2/quickie-ip.html
> 
> 
> 
> Antony.
> 
> 


