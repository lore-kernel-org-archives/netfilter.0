From: aksingh@hss.hns.com
Subject: raw packets and netfilter hooks
Date: Mon, 24 May 2004 10:12:57 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF05B21F46.38BC6A9A-ON65256E9E.0019030C@hss.hns.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org





Hi,

      I had this doubt about raw packets :
                              suppose I inject a raw packet into ip using
libnet_write, the packet was made using libnet_autobuild_ipv4. now once I
run that .out file, it says "written 20 bytes to the wire, check the wire".
     Whats does this mean, writing raw packets to the wire, iirespective of
   what that means, what actually happens (as far as i know) is that
   writing raw packet cause the packet to be handed to ip, and not directly
   written to the wire (i.e not directly written to the ethernet interface,
   supposing the link level protocol is ethernet.). Now, my doubt is what
   path does this packet take?, once ip gets this packet a routing decision
   is made for this and depending on the routing decision the packet either
   goes out of the machine(to the wire) or to the applications, if it was
   meant for a particular application on the same machine. Am I right here
   ?
     Also, when this packet is wriiten to IP the kernel surely allocates an
   skbuff, so what does skb->sk->type point to for such packets, should be
   SOCK_RAW for raw packets. Am i right ?
   So, which netfilter hook should I expect to catch these pacekts,
   IP_LOCAL_OUT or IP_POST_ROUTING ? I say this because I have written a
   kernel module which does this : (sk is struct sock *sk)
               if ((skb->sk->type==SOCK_RAW) &&
(skb->nh.iph->daddr==*(unsigned int *) dest_ip))
                     if (!y) { printk("caught the packet i injected"); y++
;}
               these two lines in my ip_local_out hook call back function,
but the raw packet i inject( I inject raw packets with dest ip==ip of the
local machine, i.e the same machine on which my ip_local_out hooks call
back function is registered) never seems to get caught. So, I feel i have
got my understanding wrong as far as points one and two are concerned.

Pls correct me if I am wrong.

thanks
Amit


