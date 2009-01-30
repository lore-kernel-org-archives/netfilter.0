From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: icmp forward
Date: Fri, 30 Jan 2009 09:33:17 +0100
Message-ID: <4982BB4D.5020708@unipex.it>
References: <4982B7F3.4020603@cetrtapot.si>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4982B7F3.4020603@cetrtapot.si>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Cc: netfilter@vger.kernel.org

Hinko Kocevar wrote:
> Hi all,
> 
> I'm an absolute beginner on the netfilter stuff, so please bear with me here.
> 
> We have a device running linux 2.6.19 kernel with iptables installed. It acts
> a a gateway for a another mobile device that connects to linux device via irda
> port - ppp connection. I've managed to port forward telnet port to mobile device
> with the help of this page http://kreiger.linuxgods.com/kiki/?Port+forwarding+with+netfilter.
> Our customers want to be able to ping the mobile device behind the linux firewall
> and IMHO it is not possible for ICMP packets to be forwarded since it is a protocol
> by itself (not a TCP/UDP style service).
> 
> 
> Is it possible to 'port forward' ICMP requests?
> 

Sure? Looking at firsts google reply, you can find

iptables -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p icmp DNAT --to-destination 10.2.1.1

end so on...

Or I miss something?

> Thank you,
> HK
> 

Michele
