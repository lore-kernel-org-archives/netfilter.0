From: "Gabby James" <lizard0000092@hotmail.com>
Subject: Re: Best Practices for iptables
Date: Fri, 05 Dec 2003 07:28:52 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY10-F93C08B4wQyk40000d081@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Yep, I did forget to designate my interface.  So, assuming I do that, which 
is the best way of forming rules - example A or B?


>From: Ray Leach <raymondl@knowledgefactory.co.za>
>To: Netfilter Mailing List <netfilter@lists.netfilter.org>
>Subject: Re: Best Practices for iptables
>Date: Fri, 05 Dec 2003 16:11:42 +0200
>
>On Fri, 2003-12-05 at 16:01, Gabby James wrote:
> > Hi,
> >
> > I want to allow everything on eth1 and be selective on eth0.  What is 
>the
> > best way of handling unwanted packets?
> >
> > A) Change the policy of the chain to DROP then allow what I want.  
>Example:
> > iptables -P INPUT DROP
> > iptables -A INPUT -p tcp -m tcp --dport 22 --syn -j ACCEPT
> >
> >
> > B) or leave the policy of the INPUT chain to ACCEPT but put REJECT rules 
>at
> > the end. Example:
> > iptables -A INPUT -p tcp -m tcp --dport 22 --syn -j ACCEPT
> > iptables -A INPUT -p tcp -m tcp -j REJECT
> > iptables -A INPUT -p udp -m udp -j REJECT
> > iptables -A INPUT -p icmp -j DROP
> >
> > This will give me the same outcome won't it?
>No, none of your rules reference the interface, e.g -i eth0
>So your rules allow/reject on all interfaces.
>
> >
> > Thanks in advance!
> >
> > _________________________________________________________________
> > Winterize your home with tips from MSN House & Home.
> > http://special.msn.com/home/warmhome.armx
>--
>--
>Raymond Leach <raymondl@knowledgefactory.co.za>
>Network Support Specialist
>http://www.knowledgefactory.co.za
>"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
>Key fingerprint = 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
>--
><< signature.asc >>

_________________________________________________________________
Our best dial-up offer is back.  Get MSN Dial-up Internet Service for 6 
months @ $9.95/month now! http://join.msn.com/?page=dept/dialup


