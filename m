From: Patrick Schaaf <bof@bof.de>
Subject: Re: Iptables don't understand network address
Date: Tue, 9 Jul 2002 08:22:13 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020709082213.Z13116@oknodo.bof.de>
References: <3D2A78FA00000B90@mel-rta7.wanadoo.fr>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3D2A78FA00000B90@mel-rta7.wanadoo.fr>; from CARICAND.Jean-Michel@wanadoo.fr on Tue, Jul 09, 2002 at 09:03:00AM +0200
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
Content-Transfer-Encoding: 7bit
To: Jean-Michel CARICAND <CARICAND.Jean-Michel@wanadoo.fr>
Cc: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Tue, Jul 09, 2002 at 09:03:00AM +0200, Jean-Michel CARICAND wrote:
> I have a local network with 10.0.2.0 address and 255.255.254.0 netmask. 
>  
> My firewall have IP 10.0.2.130 on eth0. 
> My station have IP 10.0.2.2.
> 
> I configure my firewall for drop the ping from the station with 1 rules :
> 
> # iptables -A INPUT -i eth0 -s 10.0.2.2 -p icmp -j DROP 
> 
> When I ping the firewall from my station (ping 10.0.2.130) , I receive an response from the serveur 
> Why ?

Is this the one and only in your ruleset? I can't see a reason why it would
fail blocking the ping, unless there are other rules before that one,
or some kind of NAT going on.

Please confirm that it's the only rule, and no NAT or MASQUERADE is being done.

> What is the problem ? My netmask ?

I doubt that.

> If i modify my netmask to 255.0.0.0 on firewall and my station, the ping doesn't work. Normal !

Hmm.

Did you use "iptables -L -v" to see the packet/byte counters of the rules
increase as you do the ping tests? If not, please do so.

> Iptables don't understand network address not in class A, B or C 

That's definitely NOT the case. iptables does not know anything about
classful networking. It works with arbitrary netmasks. They can even
have "holes" in them, iptables doesn't care.

best regards
  Patrick

