From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Routing problem
Date: Fri, 13 Feb 2004 17:12:43 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402131712.44158.Antony@Soft-Solutions.co.uk>
References: <002c01c3f247$9d3ee350$1530a8c0@HUSH> <200402131550.25323.Antony@Soft-Solutions.co.uk> <003301c3f24e$a8683b80$1530a8c0@HUSH>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003301c3f24e$a8683b80$1530a8c0@HUSH>
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

On Friday 13 February 2004 4:30 pm, Carlos Fernandez Sanz wrote:

> > > Before you ask: I can't connect this special computer to the same place
> > > I connect the linux box (which would be the obvious solution) because
> > > the carrier expects traffic to come from one WAN IP, owned by the linux
> > > box.
> >
> > How do they expect you to use any of the other IPs in the pool they have
> > given you?
>
> I do use them by redirecting traffic from the linux box to the destination
> boxes (such as all trafic for public IP 2 goes to 192.168.21.2, for
> example). This works fine, *except* in this particular case, where any
> NATing is not an option. I need the computer behind the linux box to
> actually own the public address, because it signs packets with it.

I still don't understand.   One of your above statements must be incorrect:

 - either the ISP requires all your outgoing traffic to come from a single 
public address,

 - or you can send traffic from IP1, IP2, IP3 etc as you wish.

If the first is true (you have to send all traffic from just a single address) 
then I don't see how you can do NAT from IP2 to 192.168.21.2, because the 
reply packets going back out to the Internet are going to have the source 
address (after de-NATting) of IP2 - therefore you *are* being allowed to send 
from more than one public IP.

If the second is true (you can send from IP1, IP2, IP3 etc as you wish) then 
as you said in the first place, you can connect the user who wants to use 
some nasty protocol which embeds OSI layer 3 information into OSI layer 7 
traffic to the same place as your existing Linux box and give them a real 
public IP of their own.

What does your ISP claim will happen if you use more than one of your assigned 
pool of IP addresses for the source address of outgoing traffic?

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.


