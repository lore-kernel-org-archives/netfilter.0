From: "Marcelo Moreira" <marcelom@qualitau.com>
Subject: Re: Packet Sniffing
Date: Mon, 14 Apr 2003 14:52:38 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01a401c302d0$2abbcdf0$a828a8c0@qualitau.com>
References: <ABEKJILKOKKGGDJKHKDFGEKFCAAA.patrick@vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Patrick Ahler <patrick@vikus.com>, netfilter EMAIL <netfilter@lists.netfilter.org>

From: "Patrick Ahler" <patrick@vikus.com>
> Want to setup a machine inside the network to packet sniff. I was hoping
> iptables could do this. What I'd like is if iptables would route each
> incoming packet to the correct machine, but also direct it to the packet
> sniffer (in other words duplicate the packet and send to 2 destinations).
>
> Just wondering if this is possible and if it is how can I set this up?
I've
> also tried doing all my packet sniffing off the firewall, but I've been
> unsuccessful, can't seem to get ethereal to look at the forwarded packets.
> If someone knows a way to successfully do setup either solutions please
let
> me know.

I think things are a bit misconcepted over here...

First, the sniffer machine needs not to receive any packet. It just grabs
them from the network when in promiscous mode.
Also, if you have a switch on your internal network, not all packets will be
broadcasted to the sniffer. So your best choice is to run the sniffer on the
firewall itself, where all the traffic passes through (or just set up a
small hub -- not a switch -- on it's input interface along with the sniffer
computer, this should also work).
The way I do when I need to troubleshoot something is to run tcpdump with
the -w option to capture to a packet file, along with the -s 0 (to capture
full packet), and then open the saved file with ethereal to check the
packets. It works perfectly. But if you need real time sniffing then go for
the prior option (the one with the little hub).

Have fun,
Marcelo.



