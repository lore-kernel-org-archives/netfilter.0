From: "Jan Kaastrup" <jka@protego.dk>
Subject: Problems with kernel 2.6.1 and iptables
Date: Mon, 16 Feb 2004 11:13:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005801c3f475$91a645d0$2d64a8c0@pcjka>
References: <200402131712.44158.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402131712.44158.Antony@Soft-Solutions.co.uk>
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
To: 'netfilter' <netfilter@lists.netfilter.org>

Hi list
I have search google for this error most of my weekend, and I cannot get
the answer :(
I have upgraded my kernel to 2.6.1 and made all the iptables stuff as
modules.
I can load all modules by hand perfectly, but still i get this error:
#Iptables -L
iptables v1.2.9: can't initialize iptables table `filter': Table does
not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

I have reinstalled iptables and done depmod -a
I have installed module-init-tools-2.0-pre10

It seems like it cannot mount modules automaticly, any ideas?
Which modules should absolutly be loaded, to make iptables work?
Could it be, that i am missing a
iptables-need-to-be-installed-to-make-iptables-work-for-kernel-2.6.x-pac
ket?

Thanks a lot



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: 13. februar 2004 18:13
To: netfilter
Subject: Re: Routing problem


On Friday 13 February 2004 4:30 pm, Carlos Fernandez Sanz wrote:

> > > Before you ask: I can't connect this special computer to the same
place
> > > I connect the linux box (which would be the obvious solution)
because
> > > the carrier expects traffic to come from one WAN IP, owned by the
linux
> > > box.
> >
> > How do they expect you to use any of the other IPs in the pool they
have
> > given you?
>
> I do use them by redirecting traffic from the linux box to the
destination
> boxes (such as all trafic for public IP 2 goes to 192.168.21.2, for
> example). This works fine, *except* in this particular case, where any
> NATing is not an option. I need the computer behind the linux box to
> actually own the public address, because it signs packets with it.

I still don't understand.   One of your above statements must be
incorrect:

 - either the ISP requires all your outgoing traffic to come from a
single 
public address,

 - or you can send traffic from IP1, IP2, IP3 etc as you wish.

If the first is true (you have to send all traffic from just a single
address) 
then I don't see how you can do NAT from IP2 to 192.168.21.2, because
the 
reply packets going back out to the Internet are going to have the
source 
address (after de-NATting) of IP2 - therefore you *are* being allowed to
send 
from more than one public IP.

If the second is true (you can send from IP1, IP2, IP3 etc as you wish)
then 
as you said in the first place, you can connect the user who wants to
use 
some nasty protocol which embeds OSI layer 3 information into OSI layer
7 
traffic to the same place as your existing Linux box and give them a
real 
public IP of their own.

What does your ISP claim will happen if you use more than one of your
assigned 
pool of IP addresses for the source address of outgoing traffic?

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent
of the 
time, and the remaining fifty percent takes another ninety percent of
the 
time.




