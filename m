From: Jason Opperisano <opie@817west.com>
Subject: Re: restriction for some hosts.
Date: Thu, 2 Dec 2004 12:55:37 -0500
Message-ID: <20041202175537.GA5532@bender.817west.com>
References: <d594c764041202032049654f4b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <d594c764041202032049654f4b@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Dec 02, 2004 at 03:20:10AM -0800, BusyBoy wrote:
> Hello,
> 
> I need some help in iptables  and I want to allow   some  hosts
> to ping to my box and rest of the network or internet blocked.
> 
> like I have linux box 192.168.0.1 (Gateway) and 192.168.0.2 to
> 192.168.0.100 are clients.
> 
> I want only
> 
> 192.168.0.5
> 192.168.0.10
> 192.168.0.55
> 
> to be allowed to ping my linux box 192.168.0.1 and internet hosts  but
> rest of the machines should be  blocked.( not being able  to ping and
> traceroute )
> 
> any help in this reagrd will be highly appriciated.

traceroute can use either ICMP Echo Requests with TTL's incrementing
from 1, or UDP packets starting at UDP port 33434.  these rules
accommodate both types:

  PINGERS="192.168.0.5 192.168.0.10 192.168.0.55"

  # allow specific hosts to ping fw and traceroute via UDP
  for i in $PINGERS; do
    iptables -A INPUT -p icmp --icmp-type echo-request -s $i -j ACCEPT
    iptables -A INPUT -p udp --dport 33434:33534 -s $i -j ACCEPT
  done

  # allow specific hosts to ping internet and traceroute via UDP
  for i in $PINGERS; do
    iptables -A FORWARD -p icmp --icmp-type echo-request -s $i -j ACCEPT
    iptables -A FORWARD -p udp --dport 33434:33534 -s $i -j ACCEPT
  done

i'm assuming you utilize "-P DROP" on your filter chains, and "-m state
--state ESTABLISHED,RELATED -j ACCEPT" at the top of each filter chain.

-j

--
"Do you want to change your name to Homer Junior? The kids can call
 you Hoju!"
        --The Simpsons


