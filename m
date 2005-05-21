From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: LAN pass, but not loopback
Date: Sat, 21 May 2005 18:24:40 -0500
Message-ID: <428FC338.4090402@riverviewtech.net>
References: <200505210026.47727.98111@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505210026.47727.98111@free.fr>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> The problem is it doesn't : it contain, among other things
> #Loopback interface
> iptables -A INPUT -o lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
> 
> From the inside, wget http://my_server works as it should, from outside also, 
> but not from the computer himself !
> For the same reason (i think) Samba cannot connect to CUPS... and I've many 
> other problems.
> I've tried as I could to understand this problem but failed. On the other 
> hand, each time I suspected a bug in a complex software (iptables here), I 
> was wrong.
> So, if one would have time to tell me were... mummy would be very happy as she 
> could print again -_^.

What interface / IP do you have Apache, Samba, and CUPS listening on?  I am willing to bet that they are not listening on lo (127.0.0.1).  The reason that I ask is that I'm betting that your services are trying to talk to each other on your internal LAN interface (eth1).  You might also want to try setting a filter:FORWARD policy of ACCEPT for testing to see if things start working again.

> By the way, what do you think of the way I tried to reduce the overload due to 
> TARPIT ? Would it work ?

I like the way that you are using a subchain to do your possible TARPITing and jumping to that chain from all your other chains that you want to TARPIT the traffic from.  However I think you might want to emulate this functionality in the raw table so that you can send the traffic that you would want to send to the TARPIT target to the NOTRACK state to prevent the connection tracking subsystem form consuming resources tracking said traffic.  The basic idea behind this is laid out below:

iptables -t raw -A PREROUTING -p tcp --dport 80 -j NOTRACK
iptables -t filter -A INPUT -p tcp --dport 80 -j TARPIT
iptables -t filter -A FORWARD -p tcp --dport 80 -j TARPIT

This will cause any web traffic (Code Red, etc.) that would be destined to your firewall to be sent to the TARPIT target with out consuming any connection tracking resources as they are told to not be tracked via the NOTRACK target in the raw:PREROUTING table and chain.



Grant. . . .

