From: "anantharaman.iyer" <ananth@mail.mynetsec.com>
Subject: Re: a small quick and dirty solution
Date: Tue, 12 Aug 2003 16:28:40 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030812105840.M24599@mail.mynetsec.com>
References: <20030812075752.GA16407@staticky.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030812075752.GA16407@staticky.com>
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
Content-Transfer-Encoding: 7bit
To: Payal Rathod <payal-iptables@staticky.com>, Netfilter ML <netfilter@lists.netfilter.org>

hello payal,

Generally the default policy of any firewall is kept as "Default Deny" and 
then the administrator can open up the required ports. So any packet hitting 
the firewall, it is examined against the ruleset base and if there is any 
entry in the rules matching with that of the packet (for. eg.: the source ip 
source port and the destination ip destination and also the mentioned 
service). In the event when none of the existing ruleset is found to be 
matching, then the firewall takes the action depending on the default rule, 
which in most of the cases is DROP. 
The definition of the DROP policy as per the tutorials on the netfilter site 
is as below 
"The DROP target does just what it says, it drops packets dead and will not 
carry out any further processing. A packet that matches a rule perfectly and 
is then Dropped will be blocked. Note that this action might in certain 
cases have an unwanted effect, since it could leave dead sockets around on 
either host. A better solution in cases where this is likely would be to use 
the REJECT target, especially when you want to block port scanners from 
getting too much information, such on as filtered ports and so on. Also note 
that if a packet has the DROP action taken on it in a subchain, the packet 
will not be processed in any of the main chains either in the present or in 
any other table. The packet is in other words totally dead. As we've seen 
previously, the target will not send any kind of information in either 
direction, nor to intermediaries such as routers."
For further reference there is the link of that site
http://iptables-tutorial.frozentux.net/iptables-tutorial.html
For any further clarifications, do let me know.

Regards

Iyer Anantharaman
Senior Infosec Consultant

On Tue, 12 Aug 2003 07:57:52 +0000, Payal Rathod wrote
> Hi,
> I am on a linux box (mdk 9.1) which is connected to net. I want to allow
> internal windows machine 192.68.10.x to browse the net and anything
> (NAT). But
> nobody should be allowed to access any port from outside the LAN. Except
> for ftp services on port 21.
> I have a problem understanding the default DROP policy and then opening
> required ports. Can someone give an example on this please?
> 
> Thanks a lot in advance and bye.
> With warm regards,
> -Payal
> 
> -- 
> For GNU/Linux Success Stories and Articles visit:
>           http://payal.staticky.com



--
Open WebMail Project (http://openwebmail.org)


