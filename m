From: Alexis <alexis@attla.net.ar>
Subject: Re: Problems with kernel 2.6.1 and iptables
Date: Mon, 16 Feb 2004 10:18:03 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1458943229.20040216101803@attla.net.ar>
References: <200402131712.44158.Antony@Soft-Solutions.co.uk>
 <005801c3f475$91a645d0$2d64a8c0@pcjka>
Reply-To: Alexis <alexis@attla.net.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005801c3f475$91a645d0$2d64a8c0@pcjka>
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
To: Jan Kaastrup <jka@protego.dk>
Cc: netfilter <netfilter@lists.netfilter.org>

you need to change some things in /etc/rc.sysinit in order to modules
work again.

check for /proc/ksyms in that file and change it to /proc/kallsyms.
then do a depmod -a

maybe these changes could help you

http://thomer.com/linux/migrate-to-2.6.html


hope it helps



Hello Jan,

Monday, February 16, 2004, 7:13:48 AM, you wrote:

JK> Hi list
JK> I have search google for this error most of my weekend, and I cannot get
JK> the answer :(
JK> I have upgraded my kernel to 2.6.1 and made all the iptables stuff as
JK> modules.
JK> I can load all modules by hand perfectly, but still i get this error:
JK> #Iptables -L
JK> iptables v1.2.9: can't initialize iptables table `filter': Table does
JK> not exist (do you need to insmod?)
JK> Perhaps iptables or your kernel needs to be upgraded.

JK> I have reinstalled iptables and done depmod -a
JK> I have installed module-init-tools-2.0-pre10

JK> It seems like it cannot mount modules automaticly, any ideas?
JK> Which modules should absolutly be loaded, to make iptables work?
JK> Could it be, that i am missing a
JK> iptables-need-to-be-installed-to-make-iptables-work-for-kernel-2.6.x-pac
JK> ket?

JK> Thanks a lot



JK> -----Original Message-----
JK> From: netfilter-admin@lists.netfilter.org
JK> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
JK> Sent: 13. februar 2004 18:13
JK> To: netfilter
JK> Subject: Re: Routing problem


JK> On Friday 13 February 2004 4:30 pm, Carlos Fernandez Sanz wrote:

>> > > Before you ask: I can't connect this special computer to the same
JK> place
>> > > I connect the linux box (which would be the obvious solution)
JK> because
>> > > the carrier expects traffic to come from one WAN IP, owned by the
JK> linux
>> > > box.
>> >
>> > How do they expect you to use any of the other IPs in the pool they
JK> have
>> > given you?
>>
>> I do use them by redirecting traffic from the linux box to the
JK> destination
>> boxes (such as all trafic for public IP 2 goes to 192.168.21.2, for
>> example). This works fine, *except* in this particular case, where any
>> NATing is not an option. I need the computer behind the linux box to
>> actually own the public address, because it signs packets with it.

JK> I still don't understand.   One of your above statements must be
JK> incorrect:

JK>  - either the ISP requires all your outgoing traffic to come from a
JK> single 
JK> public address,

JK>  - or you can send traffic from IP1, IP2, IP3 etc as you wish.

JK> If the first is true (you have to send all traffic from just a single
JK> address) 
JK> then I don't see how you can do NAT from IP2 to 192.168.21.2, because
JK> the 
JK> reply packets going back out to the Internet are going to have the
JK> source 
JK> address (after de-NATting) of IP2 - therefore you *are* being allowed to
JK> send 
JK> from more than one public IP.

JK> If the second is true (you can send from IP1, IP2, IP3 etc as you wish)
JK> then 
JK> as you said in the first place, you can connect the user who wants to
JK> use 
JK> some nasty protocol which embeds OSI layer 3 information into OSI layer
JK> 7 
JK> traffic to the same place as your existing Linux box and give them a
JK> real 
JK> public IP of their own.

JK> What does your ISP claim will happen if you use more than one of your
JK> assigned 
JK> pool of IP addresses for the source address of outgoing traffic?

JK> Antony.



-- 
Best regards,
 Alexis                            mailto:alexis@attla.net.ar



