From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Two IP add
Date: Thu, 5 Jun 2003 18:56:48 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306051856.48803.Alistair@nerdnet.ca>
References: <200306051156.45624.pandre@darkstar.nom.za> <200306051951.33575.pc-secure@home.nl> <200306051954.50078.pc-secure@home.nl>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200306051954.50078.pc-secure@home.nl>
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
To: Pascal Italiaander <pc-secure@home.nl>, Netfilter Mailing List <netfilter@lists.netfilter.org>

On June 5, 2003 01:54 pm, Pascal Italiaander wrote:
> Op donderdag 5 juni 2003 19:51, schreef u:
> > Op donderdag 5 juni 2003 15:29, schreef Ray Leach:
> > > On Thu, 2003-06-05 at 13:38, Dharmendra.T wrote:
> > > > On Thu, 2003-06-05 at 15:26, Paulo Andre wrote:
> > > >         I would like to do the following:
> > > >
> > > >         Stop MASQUESRADING to two servers say. 10.10.10.5 and
> > > > 10.10.10.8, how would i do this with a rule.
> > > >
> > > >         iptables -t nat -A POSTROUTING -s x.x.x.x -d ! 'servers ip'
> > > > -j MASQUERADE now how would i put in two ip address's ?
> >
> > Ok , you could do something like this:
>
> sorry in the first reply was an error !!
> this is fixed now.
>
>  NO_MASK="10.10.10.5 10.10.10.8"
>
>  if [ ${NO_MASK} != "" ] ; then
>    for nomask in ${NO_MASK}; do
>   	iptables -t nat -A POSTROUTING -s x.x.x.x -d ! ${nomask} -j MASQUERADE
>  done;
>  fi
>
> > this is a bit more flexible, cause , you can ad more ip's the NO_MASK
> > easily without changing the rule itself, or have to write a new line.
>
>  Pascal


	I somehow don't think this will do what we want here.
	rule 1 from this loop will MASQUERADE any ip that is 
	NOT 10.10.10.5, which unfortunately includes 10.10.10.8
	and rule #2 will never be hit by the 10.10.10.8 packet.

	I would suggest that we want to take the entire segment
	and manage it separately, but I have no experience with
	creating user chains in the nat table, although this *might* 
	work -- ymmv
	

iptables -t nat -N masq_filter
iptables -t nat -A POSTROUTING -s x.x.x.x -d 10.10.10.0/24 -j masq_filter 
# the above line includes an assumption that MIGHT BE WRONG!!!! I dont know 
# what your netmask is!!!!!!!!!
iptables -t nat -A masq_filter -d 10.10.10.5 -j RETURN
iptables -t nat -A masq_filter -d 10.10.10.8 -j RETURN
iptables -t nat -A masq_filter -j MASQUERADE

	filling in out the ips to NOT masquerade one at a time, perhaps with a loop
	as pascal suggests above, with appropriate modifications... 	
-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

