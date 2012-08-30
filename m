From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Re: Adding support for Stateless Static NAT for TAP devices
Date: Thu, 30 Aug 2012 14:38:05 +0200
Message-ID: <503F5EAD.3070008@conversis.de>
References: <7F9A6D26EB51614FBF9F81C0DA4CFEC8026E2BC561E5@il-ex01.ad.checkpoint.com> <20120830091416.GD6814@stefanha-thinkpad.localdomain> <7F9A6D26EB51614FBF9F81C0DA4CFEC8026E2BC56295@il-ex01.ad.checkpoint.com> <CAJSP0QWnZ6Nrf4q6QnU9avkNnEy8d7_CP8pbcU2QQhMJq-eeLg@mail.gmail.com> <7F9A6D26EB51614FBF9F81C0DA4CFEC8026E2BC562D6@il-ex01.ad.checkpoint.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7F9A6D26EB51614FBF9F81C0DA4CFEC8026E2BC562D6@il-ex01.ad.checkpoint.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Basila <jbasila@checkpoint.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Anthony Liguori <aliguori@us.ibm.com>, Rusty Russell <rusty@rustcorp.com.au>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 08/30/2012 12:58 PM, John Basila wrote:
> Please allow me to add a few comments:
> 
> The problem here is related to the fact that QEMU is executed with multiple instances and all instances start from the same snapshot, thus if they all send a UDP DNS query, they will all create a packet - for example - 10.0.0.2:2345 -> DNSERVER:53. The source port is the same. The first packet that reaches the ipfilter will result in going over the iptables rules and get NATed properly, the second QEMU instance that will send the same UDP packet will not get to run over the iptables rules as the ipfilter already saw this packet and the packet should be "RELATED" to a different connection and thus will cause the response packets of machine B to be received via machine A as the NAT rule will de-NAT the return packet to to the relevant connection which is related to machine A.
> 
> John
> 
> -----Original Message-----
> From: Stefan Hajnoczi [mailto:stefanha@gmail.com] 
> Sent: Thursday, August 30, 2012 1:44 PM
> To: John Basila
> Cc: qemu-devel@nongnu.org; Anthony Liguori; Rusty Russell; netfilter@vger.kernel.org
> Subject: Re: Adding support for Stateless Static NAT for TAP devices
> 
> On Thu, Aug 30, 2012 at 10:27 AM, John Basila <jbasila@checkpoint.com> wrote:
>> I have tried NAT and this is why I came up with this feature.
> 
> QEMU's net/tap.c is the wrong place to add NAT code.  The point of tap is to use the host network stack.  If you want userspace networking, use -netdev user or -netdev socket.
> 
> Please look into iptables more.  I have CCed the netfilter mailing list.  The question is:
> 
> The host has several tap interfaces (tap0, tap1, ...) and the machine on the other end of each tap interface uses IP address 10.0.0.2.  So we have:
> 
> tap0 <-> virtual machine #0 (10.0.0.2)
> tap1 <-> virtual machine #1 (10.0.0.2)
> tap2 <-> virtual machine #2 (10.0.0.2)
> 
> Because the virtual machines all use the same static IP address, they cannot communicate with each other or the outside world (they fight over ARP).  We'd like to NAT the tap interfaces:
> 
> tap0 <-> virtual machine #0 (10.0.0.2 NAT to 192.168.0.2)
> tap1 <-> virtual machine #1 (10.0.0.2 NAT to 192.168.0.3)
> tap2 <-> virtual machine #2 (10.0.0.2 NAT to 192.168.0.4)
> 
> This would allow the virtual machines to communicate even though each believes it is 10.0.0.2.
> 
> How can this be done using iptables and friends?

Why do the systems have the same IP? That seems like a broken network
config to me.

Regards,
  Dennis

