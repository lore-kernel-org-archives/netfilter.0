From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: help on DMZ project
Date: Thu, 13 Mar 2003 14:58:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030313145842.44367092.arnt@c2i.net>
References: <20030313114142.2704C1BB2FE@mail.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030313114142.2704C1BB2FE@mail.powweb.com>
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
Cc: Chris Partsenidis <Chris@Firewall.cx>

On Thu, 13 Mar 2003 11:41:42 -0000, 
"Chris Partsenidis" <Chris@Firewall.cx> top posted in message 
<20030313114142.2704C1BB2FE@mail.powweb.com>:
> > 
> > ---------- Original Message -------------
> > Subject: help on DMZ project
> > Date: Thu, 13 Mar 2003 17:16:27 +0800
> > From: "louie miranda" <lmiranda@chikka.com>
> > To: <netfilter@lists.samba.org>
> > 
> > 
> > I currently have a project to make a DMZ farm of servers. I actually
> > want to make this firewall
> > be splitted in to 4 or more networks. I'll be trying to host 3
> > different company, I would like to
> > try using Iptables as my main firewall and gateway before the
> > internet.
> > 
> > Could this be done? And which documents should i read? I currently

..piece of cake, several ways:  http://ipcop.org/  needs its 
own box, http://shorewall.net/ does really does too in your 
case, add in http://webmin.com/ to control it too, from a web 
browser, or, you can control both from ssh.  

> > have a different network that i am masquerading right now. But i had
> > never tried a dmz type that is so complicated yet for me.
> > 
> > Hope i could have feedback on my problem!
> > 
> > 
> > --
> > thanks,
> > louie miranda
> > 
> Louie,
> 
> If you would like to see a few different DMZ configurations, please
> visit my website : www.firewall.cx 
> 
> Under the "Firewalls" menu you will find the DMZ topic.
> 
> Also, under 'Firewalls-->NAT-->Static NAT--> Concepts and Examples'
> you will find a nice DMZ example to help you, should you decide to
> implement it.
> 
> Cheers,
> 
> Chris P.
> www.Firewall.cx

.."This site is best viewed at 1024x768 - Minimum resolution: 
800x600 in full screen mode ".   Ok, your menu button bar tries 
to span all 1600 dot, I like galeon to look nice in its window, 
try http://validator.w3.org/ to diagnose it.

..otherwise, nice site, 1 nit: a dmz might have a more 
"dangerous" color.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



