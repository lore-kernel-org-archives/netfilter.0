From: michael@floog.net
Subject: Re: How to drop/reject packets amongst LAN clients?
Date: Mon, 10 May 2004 10:31:39 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084210299.409fbc7b3288c@webmail.floog.net>
References: <1084206191.409fac6f1176a@webmail.floog.net> <200405101743.54501.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405101743.54501.Antony@Soft-Solutions.co.uk>
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

Hi Antony,

Thanks for the rapid response to my post.  I see you what you are
saying.

Maybe I could add a 3rd NIC to the linux router/firewall box and call it
eth2 and give it a different subnet like 192.168.2.1 and then
192.168.1.9 will become 192.168.2.2 on the new subnet.

By doing so, will I then be able to route data from only the *.7 and
*.8
connections on subnet 192.168.1.1 to the box on 192.168.2.2? 

Thanks for the guidance.

Mike


Quoting Antony Stone <Antony@Soft-Solutions.co.uk>:

> Netfilter (on the gateway router) is no use to you here, because
> packets 
> between machines on the same subnet do not go through the router -
> they just 
> talk to each other directly across your hub / switch.
> 
> Install netfilter on 192.168.1.9 and put rules in the INPUT chain:
> 
> iptables -A INPUT -A INPUT -s 192.168.1.7 -j ACCEPT
> iptables -A INPUT -A INPUT -s 192.168.1.0/29 -j DROP
> 
> Regards,
> 
> Antony.




