From: cc <cc@belfordhk.com>
Subject: Re: icmp echo requests
Date: Tue, 30 Sep 2003 09:26:39 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F78DBCF.3020703@belfordhk.com>
References: <3F77CE17.30605@kdtc.net> <Pine.LNX.4.53.0309291238510.2782@xena.cft.ca.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0309291238510.2782@xena.cft.ca.us>
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
To: Netfilter Group <netfilter@lists.netfilter.org>

Jim Carter wrote:

> On Mon, 29 Sep 2003, cc wrote:
> 
>>I've been monitoring the NAT router with pktstat and am a little
>>perturbed to see quite a lot of icmp echo requests.  Now I've
>>setup my Linux firewall to reject icmp echo requests.
>>
>>Is this the right(?)/correct/valid/appropriate thing to do?
> 
> 
> I see a lot of pings too.  At home my Linksys residential gateway reports
> that they look like they were address spoofed.  (So how did it figure that
> out?)  This leads me to suspect that they are part of a distributed denial

I was about to ask you how you figured out that the addresses were
spoofed until I read it carefully. :)  But how exactly does that
happen?  I mean, if it's obvious (incoming Internet packets posing
as packets from internal network IPs) I'd understand, but if I
a packet came from aaa.bbb.ccc.ddd, how does a router determine
the authenticity?

> of service attack -- the alleged origin of the ping, to which you are
> supposed to send a packet, is the victim.

Meaning that the forged packet is sent such that any response from
my system would be sent to the forged packet's IP and not the
real one?   That's scary.  While I have read about DDOSs and DOSs,
it's quite scary that it could just happen to the IPs I handle.

> Before my home Linux gateway blew its motherboard, I just dropped all pings
> (in fact, just about everything) on the wild-side interface.  Best not to
> send ICMP-host-unreachable; best to drop all unsolicited packets silently,

That's a good point.  I'd figure that they could just leave me alone
if I told them no such host.  But then, I'd also contribute to the
ping response.

Thanks Jim

Edmund


