From: "Martin Leduc" <marled3@hotmail.com>
Subject: Re: Problem behind my DMZ
Date: Sat, 10 Jan 2004 12:55:32 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law9-F121DmWTKCV8I6000169a4@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: ramin@cannon.eng.us.uu.net
Cc: netfilter@lists.netfilter.org

> > >Is your IP forwarding turned on?
> >
> > Yes, it is.
>
>OK. Then is proxy_arp turned on?

Yes it is.  I guess the answer was provided by Antony.  The /32 address on 
my eth0 will force all packets to the destination address.  That why I cant 
ping from/behind my router the other computer before my firewall and thats 
why no body can ping my router, other than the specified address.

>
> > Can you explain to me why /32 against /28 netmask, or tell me
> > where I can get the documentation?
>
>Take a look at lartc.org.

Thank

>
> > >Please use the "ip" utility instead of ifconfig/route/arp/... It's much
> > >easier
> > >and more powerful...
> >
> > Ok I will tried, but is not installed by default with slackware.  I will
> > search where I can get it.
>
>You might be required to recompile the kernel with the Advanced Routing
>features.

Ok.  I found the iproute2 package, on lartc.org.  My Kernel is already able 
to take care about the advance routing, i have build it last upgrade.

>
>Ramin
>

Ramin, thank you very much for your help.  I realy appreciat it, your 
solutions work fine.

_________________________________________________________________
MSN Messenger : discutez en direct avec vos amis !  
http://messenger.fr.msn.ca/


