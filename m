From: DI Roman Fiedler <roman.fiedler@telbiomed.at>
Subject: What is special about loopback
Date: Thu, 17 Jan 2008 15:08:46 +0100
Message-ID: <478F616E.7070903@telbiomed.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi All,

There are some statements that PREROUTING modifications are not possible 
on packets transmitted via loopback. It seems that there is some kind of 
"short-circuit" when sending packets from localhost to localhost, I 
guess for speed advantage.

The image 
http://upload.wikimedia.org/wikipedia/de/5/5f/Nfk-traversal.png states 
that a packet would have to enter the kernel with ip_rcv to pass the 
complete netfilter architecture again, but loopback uses netif_rx(skb) 
to feedback sent packets.

Is the assumption correct, that a modified loopback module or some other 
virtual network module could feed back packets in a way that the pass 
the complete filtering arch or would the local routing tables make any 
efforts useless (even when local routing is modified)? Has someone 
already used such a thing for iptables testing? Or would two connected 
tun devices (local tunnel) do the trick?

greetings, Roman
