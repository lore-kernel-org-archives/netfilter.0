From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: h323 & nat,again
Date: Mon, 17 May 2004 23:14:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405172314.34383.Alistair@nerdnet.ca>
References: <001101c43c80$e6c44780$0f64020a@acamarpeng>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001101c43c80$e6c44780$0f64020a@acamarpeng>
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

On May 17, 2004 10:36 pm, pengjie wrote:
> sorry for the html format,now i post it again.
>
> i had read many documents but i didn't find answer.
>
> i have a network as following:
>
>         A------------------B====================C
> 192.168.110.x  192.168.110.y  202.101.k.m     202.101.k.n
>
> the B is a gateway doing NAT. it's eth0 is 192.168.110.y and eth1 is
> 202.101.k.m. there is RH9 running on it,it's kernel is 2.4.21. i have
> pathched the h323,and runned up the modules ip_conntrack_h323 and
> ip_nat_h323.
>
> the A and the C are netmeeting clients.
>
> i test it with 2 methods:
>
> 1)both A and C logon to a ILS.
>
> RESULTS:
> A calls C is ok, and they can chat to each other.
>
> C calls A is failure, i see the address called is the private address of A.
> so setting up is failure.
>
>
> QUESTION: doesn't the patch do something when client logon to a ILS?
>
> 2)call each other without the ILS.
>
> i add a rule: iptables -t nat -A PREROUTING -i eth1 -p tcp -m multiport
> --dports 1503,1720 -j DNAT --to-destination 192.168.110.x
>
> they call each other with IP address. A calls C with C's IP as the
> destination, and C calls A with gateway's valid IP as the destination.
>
> RESULTS:
> A calls C is ok, and they can chat to each other.
> C calls A is ok, but they can't chat to each other.
>
> QUESTION: is the rule right? h.323 streaming port is dynamic, does it
> result this symptom? even though i add the rule right,i think it's no
> use.it just enable one client to go through the gateway.is it?
>
> any help is appreciated.

	PREROUTING DNAT to client is only good for one session at a time.
	Please note that MS Netmeeting uses other ports as well .. .
	I've noted that the rules for Gnomemeeting work just fine for a couple of 
	'local lan' firewalls that use MS netmeeting, where I've assisted in getting
	it working.  Keep in mind that it also uses (UPNP) -- which will cause you 
	no end of grief.  -- there is an open source upnp gateway out there that 
	I've heard of but never worked with, it has been mentioned here, but most 
	consider it a *GREAT GAPING* security hole in a firewall.

	Consider that one of the points you raised is that the ILS connection reports 
	the INSIDE ip address of the client to the connecting partner.  Perhaps you 
	should arrange some method to have the *client* report its outside ip address
	to hte ILS rather than its inside ip.  (Gnomemeeting allows for this).  The 
	ONLY instance where I've managed to get several internal clients to be
	accessible from outside has been using Gnomemeeting, hacking the gconf files
	for each client to have them *listening* on different ports, and forwarding 
	each port from the firewall.  I believe there are registry hacks to do the 
	same in MS netmeeting, but have not researched it.  

	For what it's worth I rarely use MS anymore for my personal system, but do 
	have win boxen inside my firewall (other half, kids, game box, and in order
	to support several dozen personal systems clients).  I use gnomemeeting 
	through my firewall -- I've added the rules on the gnomemeeting site to my 
	firewall for the appropriate boxes.  -- it 'just works' through 2.6.x and 
	with the gnomemeeting rules for each of three boxes.  I've yet to have 
	more than one connection active at a time.

	As an aside ... Is *anyone* working on porting the h323 (conntrack/nat) 
	patches to 2.6.x? -- or is this something I might like to attempt sometime 
	in the near future??


	Alistair Tonner 

	

