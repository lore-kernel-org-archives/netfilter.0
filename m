From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: netfitler against Trojans and worms
Date: Mon, 5 Jul 2004 16:21:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407051622.00035.Antony@Soft-Solutions.co.uk>
References: <1d7da3f40407050659476384b7@mail.gmail.com> <200407051510.06470.gdh@acentral.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407051510.06470.gdh@acentral.co.uk>
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

On Monday 05 July 2004 3:10 pm, Gavin Hamill wrote:

> On Monday 05 July 2004 14:59, Saad Faruque wrote:
> > i did find couple of sites ex.
> > (http://www.doshelp.com/trojanports.htm) which lists some ports. but i
> > really am not sure if u simply block all these ports if it will effect
> > my clients regular internet activity. any alternative suggestions are
> > also welcome :)
>
> My suggestion would to stop fire-fighting and instead turn the problem on
> its head.
>
> Change your default policy from ACCEPT to DROP, and put in rules so that
> people are allowed to access port 80, 443, etc. and only the ports they
> actually NEED access to.

I agree completely with this.   Standard security practice is to "block 
everything which is not expressly allowed", and to allow only that which is 
known to be needed.

In a later posting you say you don't know what to allow - one approach which 
is very effective is to block everything, allow web, email and dns, then wait 
until your users say "I can't do X", and then decide whether they should be 
allowed to do X or not.

If it isn't you who makes the decisions about what they should be allowed to 
do, then ask the person whose decision it is to give you a list of all the 
applications they're supposed to be able to access on the Internet.

In another posting you also said that you are not able to ensure the security 
of the machines in the internal network.   A good way to deal with that is to 
apply the security policy above, but then LOG all blocked packets, and 
summarise them by source IP address on a daily basis.   Anyone whose machine 
generates enough blocked traffic that it looks like it's infected with 
something gets a DROP (or REJECT) rule in the firewall until they clean up 
their machine.

You don't have to say much to justify this - you are insisting that they clean 
their machines so that they don't spread things to other machines on the 
network.   You can stop them spreading it to the Internet, but you can't stop 
them spreading to the local LAN.

Regards,

Antony.

-- 
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

                                                     Please reply to the list;
                                                           please don't CC me.


