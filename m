From: "Jesper Lund" <jesper@ballbreaker.dk>
Subject: Re: Redirection question.
Date: Tue, 11 Mar 2003 16:20:30 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3155.212.242.51.102.1047396030.squirrel@www.ballbreaker.dk>
References: <001e01c2e7df$7bfd3430$0db600c8@ANTARES1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c2e7df$7bfd3430$0db600c8@ANTARES1>
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
To: hernan@mdp.edu.ar
Cc: netfilter@lists.netfilter.org

> Hi, i have doing transparent proxy with squid and this port redirect
> rule:
>
> iptables -t nat -A PREROUTING -i eth1 -p TCP --dport 80 -j REDIRECT
> --to-port 8080
>
> and works fine. Now, i want dont't redirect some request to destination
> dirs like 192.168.0.0/24 and 192.168.1.0/24 (for example). How i can do
> this?

You could make som ACCEPT'ing rules before you REDIRECT:

iptables -t nat -A PREROUTING -i eth1 -p TCP --dport 80 -d 192.168.0.0/24
-j ACCEPT
iptables -t nat -A PREROUTING -i eth1 -p TCP --dport 80 -d 192.168.1.0/24
-j ACCEPT

Regards, Jesper



