From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding in a NAT..
Date: Mon, 23 Sep 2002 16:22:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209231522.g8NFMrv24742@vulcan.rissington.net>
References: <F41jLlmNI5aIptmMWNC00006c22@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F41jLlmNI5aIptmMWNC00006c22@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Sunday 22 September 2002 2:53 pm, Random Person wrote:

> Yeah.. my question didn't make any sense.. Let me try again. Probably one
> of the situations that you said apply here, but just to make sure:
>
> External addr (eth0): xxx.xxx.78.48
> Internal addr (eth1): 192.168.0.1
> Addresses on LAN: 192.168.0.2-192.168.0.30
> Protocols used: tcp,udp
>
> Lets assume a packet destined for xxx.xxx.3.3:123 arrives at eth0. Is there
> a way for it to pass untouched into the LAN? (i.e. has the same dest. addr
> and source addr.).

No.

Where is the address xxx.xxx.3.3 ?   I assume it's aliased on the external 
interface of the firewall (otherwise you're not going to capture packets with 
that destination IP).   If you do not change the destination address in the 
packet using the PREROUTING chain then the packet's not going to go anywhere 
else - as far as the kernel routing table is concerned, the packet has 
arrived at its destination, so it's staying.

Which machine do you want such a packet to be sent to ?

Let's assume that it's 192.168.0.18, for no particularly good reason.

What is machine 192.168.0.18 supposed to do with a packet having xxx.xxx.3.3 
as its destination address ?   It's either going to ignore it or route it 
somewhere else - it certainly isn't going to think "ooh, that's mine !"

Maybe you could explain what you are actually trying to *do* and things might 
start to make a bit more sense ?

Antony.

-- 

This email was created using 100% recycled electrons.

