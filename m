From: "ISC Jorge Ceron Galvan" <jorgec@acerlandslp.com.mx>
Subject: Re: Advice on setting up a firewall for a Windows Domain Controller
Date: Wed, 12 Oct 2005 17:59:33 -0500
Message-ID: <WorldClient-F200510121759.AA59330145@acerlandslp.com.mx>
References: <531442a50510121004i2229579fv8bb1cae2cd1b456a@mail.gmail.com>
	<200510121317.25034.rob0@gmx.co.uk>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510121317.25034.rob0@gmx.co.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: /dev/rob0 <rob0@gmx.co.uk>, netfilter@lists.netfilter.org

Talking about restrict outbound SMTP access, I set up a linux box as a firewall and I opened only those ports my users 
need.

They need to send and receive mail, so I set up these (among other ACCEPT rules)

iptables -A FORWARD -s 1.2.3.0/27 -i eth1 -p tcp --dport  25 -j ACCEPT
iptables -A FORWARD -s 1.2.3.0/27 -i eth1 -p tcp --dport 110 -j ACCEPT
iptables -A FORWARD -s 1.2.3.0/27 -i eth1 -j DROP

But if I want to do what you suggested, restrict outbound SMTP access, should I set this?

iptables -A FORWARD -s 1.2.3.0/27 -i eth1 -p tcp --sport   25 -j DROP

( I'm new to iptables )




-----Original Message-----
From: /dev/rob0 <rob0@gmx.co.uk>
To: netfilter@lists.netfilter.org
Date: Wed, 12 Oct 2005 13:17:24 -0500
Subject: Re: Advice on setting up a firewall for a Windows Domain Controller

> On Wednesday 2005-October-12 12:04, Zacky wrote:
> > While I have set up firewalls in the past,
> 
> Out of curiosity ... what kinds of firewalls were these?
> 
> > I'm not very familiar with Windows networks and I would like to
> > hear your opinions on how to go about setting up the firewall.
> 
> What in particular are you asking? Sorry, I don't see a question in 
> that. Just to be certain we're staying on topic, this is the Linux 
> netfilter list. We assume that you've already chosen a Linux router
> as 
> your firewall. If you're asking about alternatives to Linux and 
> netfilter, you're not in the right place.
> 
> > Here's some info about the network. The DC and all the 25 Windows
> > XP desktops that connect to the DC have public IP addresses,
> 
> What a waste! Your Linux box is routing to all these IP's, I guess?
> 
> > but only the DC has a FQDN.
> 
> Meaning what, a name that resolves in DNS? How is that significant?
> 
> > The requirement is to keep the desktops' public IP 
> > addresses and just move the DC behind the firewall.
> 
> So only the DC is behind the Linux router? You want Windows desktop 
> machines on routable public IP addresses with no firewall? Is that 
> wise? Sounds like a formula for disaster. What is the reasoning
> behind 
> that decision?
> 
> > Again, any tips will be greatly appreciated.
> 
> I'll try, but it's not easy.
> 
> Windows desktops are fundamentally insecure. They'll get infected and
> start spewing spam. You definitely want to restrict their outbound
> SMTP 
> access.
> 
> Level with me ... I have absolutely no respect for "schools" and thus
> have no qualms with assisting someone with a stupid assignment.[1] Is
> that what this is?
> 
> 
> 
> [1] But if you want me to do the work for you, trust me, you cannot 
> afford my rates.[2]
> [2] Unless of course you can. :)
> -- 
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header


