From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: wireless security
Date: Thu, 10 Jun 2004 13:39:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086888854.2015.110.camel@localhost>
References: <7EACCDBB65D37443912D80713CC1245D47282C@fsnsab20.losangeles.af.mil>
	 <200406101700.57718.Antony@Soft-Solutions.co.uk>
	 <0c3201c44f06$c01c6160$49caa8c0@caris.priv>
	 <200406101741.48713.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406101741.48713.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thu, 2004-06-10 at 12:41, Antony Stone wrote:
> On Thursday 10 June 2004 5:19 pm, Peter Marshall wrote:
> 
> > > ----- Original Message -----
> > > From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> > > To: "netfilter" <netfilter@lists.netfilter.org>
> > > Sent: Thursday, June 10, 2004 1:00 PM
> > > Subject: Re: wireless security
> > >
> > > The problem Peter has, however, is that there is no single firewall
> > > between the wireless people he's trying to keep out, and the wired network
> > > he's trying to protect.   The vulnerability lies in client machines which
> > > may (inadvertently, deliberately, or unknowingly) be connected to both
> > > wired and wireless networks simultaneously.
> >
> > That was exactly my problem Antony.  Thank you for re-iterating it for me.
> > I was not sure if I was very clear after some of the responses.
> 
> The reason why I recommended a NIDS (Network Intrusion Detection System) is 
> that you can place this as a passive sniffer on the wired network, and see if 
> you get any strange traffic coming from client machines.
> 
> I accept John Sullivan's point about HIDS (Host Intrusion Detection Systems), 
> and that's a good idea (in general) for servers, however I would suggest that 
> your other client machines are just as a much in need of protection, and I 
> doubt very much that you could find a suitable HIDS to install on those, let 
> alone be able to manage them and get useful data about what's going on.
> 
> One slightly wacky idea I've had for some time which you might want to think 
> about is writing a script to run on a machine on your wired network which 
> goes round each of the IP addresses (assigned by DHCP?) of your client 
> machines, which might also have a simultaneous wireless link, and attempt a 
> traceroute through them as a default gateway.   If you get more than one hop, 
> you've got trouble.
> 
> Regards,
> 
> Antony.
Good points, as always, Antony.  I particularly like your script idea!

You are correct that my comments about HIDS was not directed towards the
clients and belies my indirect approach.  Here is where my practical
side kicks in.  I figure that no matter how zealously a user policy is
followed and enforced, as long as the control resides with the end user,
somewhere, someday, someone will violate it.  Even if they do not, they
may still be compromised by a trojan, a backdoor planted via Phishing or
an unprotected, home-user wireless network.  Therefore, I tend to
proceed under the assumption that I will be compromised (as indeed you
are by advocating NIDS).  The wireless change may provide a convenient
presentation venue to convince management to fund the security needed to
ensure that critical information is as well protected as is practical by
making sure:

1) even authorized users have access to only the information they need
and doing so in a way that minimizes impact on the business function
(http://iscs.sourceforge.net)

2) systems (possibly including user devices) are as invulnerable to
attack as possible (http://www.nessus.org + some form of patch
management / software distribution)

3) I know if someone has slipped through all the multiple layers of
defense (http://osiris.shmoo.com)

Sorry for not explaining my approach of using the wireless change as an
excuse to implement a security paradigm that assumes the attacker is on
the inside - I just thought my original e-mail was doing a good enough
job of reflecting my excessive verbosity without it :-) - John

-- 
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevelopmentcorp.com


