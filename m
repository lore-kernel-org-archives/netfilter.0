From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: wiered problem
Date: Thu, 20 May 2004 22:09:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405202209.20946.Antony@Soft-Solutions.co.uk>
References: <BAY15-F12RLNTaFagA30009460e@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F12RLNTaFagA30009460e@hotmail.com>
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

On Thursday 20 May 2004 9:45 pm, azeem ahmad wrote:

> i m running iptables, squid proxy, bind, and samba on same machine. it
> works as a server for my LAN
> the script that i ran is as follow but when i stat these rules the browsing
> stops. the squid proxy is listening on port 8080. what can be the problem.
>
> iptables -P INPUT DROP     [ correction from your later posting ]
> iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 8080 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 22   -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 53   -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 53   -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 139  -j ACCEPT

Squid may be listening on port 8080, but what about the replies it gets from 
remote web servers after it sends out a request on port 80?

I think you need a "reply packet" rule here:

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

I recommend you put this rule at the top of the list.

Regards,

Antony.

-- 
Most people have more than the average number of legs.

                                                     Please reply to the list;
                                                           please don't CC me.


