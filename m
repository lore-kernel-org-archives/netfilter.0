From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re[2]: netmeeting ?
Date: Sun, 16 Jun 2002 19:49:52 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206161849.g5GIntA31463@Networker.rockstone.co.uk>
References: <17729088316.20020616195415@gmx.de> <200206161807.g5GI7DA29086@Networker.rockstone.co.uk> <17730668368.20020616202035@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <17730668368.20020616202035@gmx.de>
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
To: IP-Tables Maillingliste <netfilter@lists.samba.org>

On Sunday 16 June 2002 7:20 pm, Corin Langosch wrote:

> Hi !
>
> thanks for the fast reply...i'm going to look for these messages.
> but i don't really understand the problem. even if netmeeting uses
> different ports, it must work i assume, when i forward the traffic
> of *all* ports from the caller's ip to my pc behind the fireall.

If that is all you were doing, then you are correct, netmeeting would 'just 
work'.

However, you are also doing Address Translation, and that makes things a 
whole lot more complicated.....

> or does netmeeting use other protocols than tcp or udp which i
> also have to forward ??

No, as far as I know netmeeting is purely TCP based, but imagine the 
following:

MachineA on real IP 192.168.1.2 contacts MachineB on routable IP 11.22.33.44 
via a NATting firewall.   Unknown to A, MachineB is also behind a NATting 
firewall, and its real address is 192.168.99.4

Part of the message which A sends to B says "My IP address is 192.168.1.2, 
and I've opened up TCP port 12345 for you to talk to me.   Please send your 
next packets to that IP/port and we can set upa communication."

Now if the firewall doesn't have a helper for this protocol which understands 
the format of a message such as this, and can change the addresses 
accordingly, it will simply go to MachineB as it is, and MachineB will do as 
it's told - try to contact 192.168.1.2 port 12345, which is unroutable; 
therefore the communication fails.

I don't know the details of netmeeting or h323, but the above gives you an 
idea of why some protocols are more complicated to send through a NATting 
firewall than others.

 

Antony.

