From: Michael Talbot-Wilson <mtw@chameleon.view.net.au>
Subject: Re: which rule is right? HUH??
Date: Thu, 30 May 2002 17:38:01 +0930
Sender: netfilter-admin@lists.samba.org
Message-ID: <200205300808.g4U881NS002185@chameleon.view.net.au>
References: <FLEKIPPLAEDMJMOOBBDPKENMCEAA.stewart.thompson@shaw.ca>
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: Your message of "Wed, 29 May 2002 20:10:29 MST."
             <FLEKIPPLAEDMJMOOBBDPKENMCEAA.stewart.thompson@shaw.ca> 
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

I noticed this message and a couple of others from this list when clearing
out my spam folder.  If you are writing in latin script, why in the name
of **** are you setting ks_c_5601-1987 as your charset?!?

If you use a Korean charset no-one will see your messages.  If you are a
Korean (this guy is in Canada), and assuming you want to send your message
in English, please set a charset appropriate to the script you are using,
that is, US-ASCII or ISO-8859-1.

> Hi:
> 
> 	You are half way there.
> 
> 	Rule 1 is ok. However you need to change rule 2.
> 	Rule 1 means - If a packet is received  from the desired ip destined fo
> r
>  the external ip for telnet. DNAT it to the internal telnet server address.
> However the packet is still sitting at the external interface.
> 
> 	Rule 2 means - if there is a packet from the desired ip to the internal
> telnet
> 	Server then forward it.
> 
> 	You will also need a rule to allow the internal traffic out if it isn't
> already in
> 	your script. I normally specify the interfaces in the rules as well. Tr
> y
> to make
> 	your rules as specific as possible. Set your default policy to drop fir
> st
> thing.
> 	Then open up things as required with specific rules.
> 
> 	I removed the ip:23 from your DNAT rule. It is ok, but is only required
>  if
> you
> 	are actually changing the destination port. Below 1024 iptables shouldn
> 't
> 	change the destination port.
> 
> Stu.........
> 
> 
> 
> 
> 1. PREROUTING chain
> 
> iptables -A PREROUTING -p tcp -s 10.0.0.1/24 --sport 1024:65535 -d \
> 211.1.1.1 --dport 23 -j DNAT --to 192.168.1.2
> 
> 2. FORWARD chain
> 
> iptables -A FORWARD -p tcp -s 10.0.0.1/24 --sport 1024:65535 -d 192.168.1.2
> \
> --dport 23 -m state --state NEW,ESTABLISHED -j ACCEPT
> 
> 
> Which is right? or both are right?
> 
> Thanks a lot.
> 
> 
> 
> 
> 
> 

