From: Andrea Rossato <mailing_list@istitutocolli.org>
Subject: Re: portfw on iptables 2.4 kernel problem.
Date: Wed, 11 Dec 2002 12:26:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF720D9.7030501@istitutocolli.org>
References: <014901c2a02a$0dbf59f0$0b00000a@nocpc3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <014901c2a02a$0dbf59f0$0b00000a@nocpc3>
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
To: netfilter@lists.netfilter.org

louie miranda wrote:
> I have an internel ftp server w/c i want to access over my linux router(gw)
> Its internel IP is 10.0.0.11 and port 21. My externel IP lets say
> 203.100.100.1.


echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -A FORWARD -d 10.0.0.11 -j ACCEPT
iptables -A FORWARD -s 10.0.0.11 -j ACCEPT

iptables -A PREROUTING -t nat -p tcp -d 203.100.100.1 --dport 21 -j DNAT 
--to 10.0.0.11
ptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source 203.100.100.1


tha should work: it's working for me, at least.
Remember that forwarded traffic must be SNATed with the source (public) 
address of the forwarding box.
andrea


