From: Alejandro Flores <alejandro.flores@triforsec.com.br>
Subject: Re: Blocking IMs
Date: Thu, 05 Aug 2004 09:00:09 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091707208.19428.5.camel@aflores>
References: <20040805060738.87455.qmail@web8308.mail.in.yahoo.com>
	 <a0f69e5040805001238287a2a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e5040805001238287a2a@mail.gmail.com>
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

	Ops,
	There's a typo in the MSN port. 
	MSN port is 1863.
iptables -I FORWARD -o ppp0 -s IpOfClient -p tcp --dport 1863 -j REJECT

Regards,
Alejandro


> Hi,
> 
> If you are running a route/firewall then you have to do things in
> FORWARD that is...
> 
> ## Droping all yahoo related ports voice, messaging, gaming
> iptables -I FORWARD -o ppp0 -s IpOfClient -p tcp -m multiport --dport
> 5000,5001,5100,5050,11999 -j DROP
> 
> # Replace -o ppp0 with your out interface, if you have different then ppp0 
>   for example -o eth0
> 
> ##Droping MSN packets
> iptables -I FORWARD -o ppp0 -s IpOfClient -p tcp --dport 1836
> 
> However if you are doing some transparent proxing, for example if you
> are running squid on the same machine that is the firewall/router
> machine then replace FORWARD with OUTPUT
> 
> iptables -I OUTPUT -o ppp0 -s IpOfClient -p tcp -m multiport --dport
> 5000,5001,5100,5050,11999 -j DROP
> 
> ##Droping MSN packets
> iptables -I OUTPUT -o ppp0 -s IpOfClient -p tcp --dport 1836
> 
> Regards
> Askar
> 
> On Thu, 5 Aug 2004 07:07:38 +0100 (BST), Sameer Gurung
> <sameersworld@yahoo.co.in> wrote:
> > IS there a way i can block yahoo chat and instant
> > messenger and msn from only specific clients from the
> > network..... the clients get their ip address from a
> > dhcp server....
> > Any help would be appreciated
> > 
> > =====
> > 
> > 
> > ________________________________________________________________________
> > Yahoo! India Matrimony: Find your life partner online
> > Go to: http://yahoo.shaadi.com/india-matrimony
> > 
> >
> 

