From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Is this correct?
Date: Fri, 20 Jun 2003 00:09:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306200009.19677.Alistair@nerdnet.ca>
References: <1056056839.18406.21.camel@localhost> <200306191806.33601.Alistair@nerdnet.ca> <1056078786.14334.88.camel@localhost>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1056078786.14334.88.camel@localhost>
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
To: Shawn <core@enodev.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>


	George's later mail is quite correct.
		
	10.0.0.0\24 
	     should contain the ip 10.0.0.1, therefor hosts on the 10.0.0.x segement 
expect to see it directly
	  10.23.4.209 will(should) have a route to the 10.0.0.x network, therefor 
will eventually find 10.0.0.1 ... 

	Point to be made if the objects on 10.0.0.0\24 *know* about 192.168.x.x as 	
	10.0.0.1 this tells me that there is likely nothing *using* 10.0.0.1  
therefor, you can ADD the 10.0.0.1 address to the eth interface of the linux 
iptables box, and simply add in the PREROUTING chain a rule to dnat 
everything to its intended destination.  Since the 10.0.0.1 address is NOT 
used by the linux iptables firewall, it wont NEED to accept any of those 
packets. -- it will be getting IT's packets on the 10.0.0.250 address ... 

	Its all as clear as mud .. but it will work.


On June 19, 2003 11:13 pm, Shawn wrote:
> > > iptables -t nat -I PREROUTING -i eth0 -d 10.0.0.1 -J DNAT \
> > > 	--to 192.168.0.1
> >
> > 	Ummm .
> >              Where is 10.0.0.1? (since the network is /24)
> > 	   If eth0's ip is 10.0.0.250 why would any packets for 10.0.0.1 end up
> > there?  Unless there is an *external* routing reference that puts
> > 10.0.0.1 through 10.0.0.250 this cannot work.  If there is such a
> > routing, the rule should work.
>
> My scenario was bogus. Sorry! It's probably more accurate to say that
> some host "10.23.4.209" is going to try to reach 10.0.0.1, and
> 10.0.0.250 is the last hop on the way there, and should DNAT those
> packets to 192.168.0.1.
>
> The problem with my original scenario was that since the hosts needing
> to reach 10.0.0.1/24 (which is really 192.168.0.1) were on the
> 10.0.0.1/24 network themselves. Why would they need to look up a route
> for a host that's supposed to be on the same network as them?
>
> So, others were saying to assign 10.0.0.1 to linux-router/eth0:1 (I
> guess) so the host would actually get all the packets intended for
> 10.0.0.1. I guess it's surprising to me if this works, because at what
> point does linux-router decide if a packet if to be forwarded or
> accepted as it's own? If eth0 has 10.0.0.1, would DNATing the packet to
> 192.168.0.1 keep linux-router from owning the packet?
>
> Hmmm...

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

