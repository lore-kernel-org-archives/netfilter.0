From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: Re: transparent squid & iptables
Date: Mon, 16 Dec 2002 16:34:27 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DFDB33B.70406@inbox.lv>
References: <008201c2a420$487f82a0$8902010a@alkaloid>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Abylai Ospan <aospan@netup.ru>
Cc: netfilter@lists.netfilter.org

iptables -A PREROUTING -t nat -p 6 --dport 80 -j REDIRECT --to-port 3128

Abylai Ospan wrote:
> Hello, All.
>  
> We tried to make transparent squid on 127.0.0.1 and REDIRECT (or DNAT) 
> in iptables but iptables redirect pakets to the received interface IP.
>  
> In the iptables:
> iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT 3128
>  
> For example:
> packet from user (IP: 10.0.0.5) to  <http://www.ru>www.ru 
> <http://www.ru>:80 received on eth0 (IP: 10.0.0.1). Packet redirected to 
> the 10.0.0.1:3128 but squid listen on 127.0.0.1:3128 so nothing work ;-(
>  
> How we can redirect packet to the 127.0.0.1 port 3128 in iptables ?!
>  
> wbr, Abylai
> NetUP Systems
> Moscow, Russia




