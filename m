From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Thu, 20 Dec 2012 20:35:44 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212202003130.26093@nerf07.vanv.qr>
References: <50D01F13.7030707@nottheoilrig.com> <50D2C156.2050801@nottheoilrig.com> <alpine.LNX.2.01.1212200858460.2026@nerf07.vanv.qr> <201212201054.25174.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201212201054.25174.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Cc: netfilter@vger.kernel.org


On Thursday 2012-12-20 16:54, Neal Murphy wrote:
>> >--destination is the ultimate destination. The default gateway for the
>> >proxy is 192.168.1.84, so when it makes a request to the origin server,
>> >it forwards it to 192.168.1.84 (--destination is 12.34.56.78)
>> >
>> >I think iptables can't tell whether the request was forwarded to
>> >192.168.1.1 or 192.168.1.84, so it can't tell whether it arrived on the
>> >"br-lan" interface or the "br-lan:1" alias?
>> 
>> It is not an iptables problem.
>> 
>> The question is, how do you define "arriving on br-lan:1"? That is,
>> looking only at one Ethernet packet, how would you tell it is "for
>> br-lan:1" rather than for br-lan? Open a hexdump, tell me which byte(s)
>> shall represent "br-lan:1".
>
>You can... Hmmm... The packet from the proxy to internet (via the gateway) 
>doesn't contain 192.168.1.84, does it?
>Perhaps the only way to make such a scheme work would be to add a second 
>primary address (i.e., in another subnet) to br-lan and to the proxy's NIC.
>Assuming the existing netmask is /24, one could `ip addr add 192.168.2.1/30 dev
>br-lan` on the gateway and `ip addr add 192.168.2.2/30 dev ethN`
>on the proxy system, then tell the proxy to use 192.168.1.84 on its internal 
>side and 192.168.2.2 on its external side.

Again: where in the Ethernet/IP packet would that be recorded? Don't
guess; *construct* one. Your favorite IP reference (be that a book,
the RFCs, Wikipedia, ...) can tell you what fields exist and need to
be filled out. Consider yourself a Linux machine sending a packet,
fill in the fields, in the direction from TCP to IP to Ethernet (i.e.
backwards). Once done, parse it (in the forward direction), like a
Linux machine receiving the packet.

The exercise here is that one sees that it is (im)possible.
