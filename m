From: Paulo Andre <pandre@darkstar.nom.za>
Subject: RE: connection problem
Date: 05 Dec 2002 15:35:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039095334.308.3.camel@bigblue>
References: <BDEFKJOAPEBPJCGDAGMFOEICCAAA.nigel@forever-networks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BDEFKJOAPEBPJCGDAGMFOEICCAAA.nigel@forever-networks.com>
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
To: Nigel Clarke <nigel@forever-networks.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Thu, 2002-12-05 at 16:56, Nigel Clarke wrote:
> Paulo,
> 
> >I have a problem where a router reboots every evening. I do not have
> >control of this router.
> 
> For this, you might want to see if the janitors unplug the router to use the
> outlet in the evening.
> Seriously.
> 
> As far as the issue with IPTABLES....this might be an issue with the ARP
> cache on the firewall. What kind of
> network card are you using? What kernel version?
> 
> I've had problem like this on some 2.2 kernel implementations with old
> network cards. I'd have to "ifconfig eth* down/up"
> for the interface to work.

I will look at that , the old network card, but the funny thing is that
I have to change the IP address on the card to another and then back to
the original for it to work.

> 
> ;-)
> 
> --
> Nigel Clarke                 Forever Networks
> Network Security Engineer    www.forever-networks.com
> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Paulo Andre
> Sent: Wednesday, December 04, 2002 10:56 PM
> To: netfilter
> Subject: connection problem
> 
> 
> I have a problem where a router reboots every evening. I do not have
> control of this router.
> The problem is with iptables, as soons as the router reboots I lose the
> connection even when the router has come up afterwards.
> I then have to take the interface down, reload the firewall script, then
> reconfigure the interface and reapply the firewall script again so that
> I can see the router again.
> 
> Can anyone tell me why this happens, the interface is a aliased
> interface, if that makes a difference.
> 
> Thanks
> 
> Paulo
> 
> 
> 
> 



