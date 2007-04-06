From: Martijn Lievaart <m@rtij.nl>
Subject: Re: packets to local addresses
Date: Fri, 06 Apr 2007 18:12:07 +0200
Message-ID: <46167157.3080409@rtij.nl>
References: <fad2fb270704060522r4322a223g4e2e40605b3fb6a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fad2fb270704060522r4322a223g4e2e40605b3fb6a@mail.gmail.com>
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
To: MKS <rekordmeister@gmail.com>
Cc: netfilter@lists.netfilter.org

MKS wrote:
> Hello list
>
> I have a scenario the a computer has 2 PPP connections, where the
> computer is the ppp client.
>
> $ifconfig
>
> ppp0   inet  10.0.0.1 p-t-p  192.168.1.1 mask 255.255.255.255
>
> ppp1 inet  10.0.1.1 p-t-p 192.168.1.1 mask  255.255.255.255
>
> for testing purpuses I want packets from ppp0 to ppp1 to actually go
> over the physical connection
>
> e.g.
>
> ping  10.0.0.1 -I ppp1 should send the packet over the ppp1 (and out
> underlyging physical interface eth0) and it should arrive on the ppp0
> interface. (routing is taken care of at the ppp server)

The -I flag only changes the source address of the packets, not the 
routing. And as the packet is destined for the machine itself, it goes 
over the loopback interface. Maybe adding the -r flag does what you 
want, but I doubt it.

Hping2 probably can do this:

       -I --interface interface name
              By default on linux and BSD systems hping2 uses default  
routing
              interface.   In  other systems or when there is no default 
route
              hping2 uses the first non-loopback interface.  However  
you  are
              able  to  force  hping2 to use the interface you need 
using this
              option. Note: you don't need to  specify  the  whole  
name,  for
              example  -I  et will match eth0 ethernet0 myet1 et cetera. 
If no
              interfaces match hping2 will try to use lo.

HTH,
M4


