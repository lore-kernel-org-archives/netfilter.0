From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: bind 9 and iptables
Date: Fri, 27 Aug 2004 15:37:07 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <412F9B73.9010603@pbl.ca>
References: <web-420408468@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-420408468@mail01.infosat.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: it clown <suse@mailbox.co.za>
Cc: netfilter@lists.netfilter.org

it clown wrote:
> Hi All
> 
> I have a dns with a forwarder to my isp on the iptables
> box. I am having trouble on getting dns to work properly.

[snip]

> I have tried the following with out any luck:
> 
> iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
> iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j
> ACCEPT
> 
> what rule do i need to add to make things more secure to
> get my dns working properly, thanks?

By the above rules, you are not allowing your clients to connect to your 
DNS server (you are only allowing DNS server to send queris outside). 
What you need is:

iptables -A INPUT -m state --state ESTABLISHED
iptables -A INPUT -p icmp -m state --state RELATED

iptables -A INPUT -i int_if -p udp --sport 1024: --dport 53 \
    -m state --state NEW -j ACCEPT
iptables -A INPUT -i int_if -p tcp --sport 1024: --dport 53 \
    -m state --state NEW -j ACCEPT

iptables -A OUTPUT -m state --state ESTABLISHED
iptables -A OUTPUT -p icmp --m state --state RELATED

iptables -A OUTPUT -o ext_if -p udp --sport 1024: --dport 53 \
    -m state --state NEW -j ACCEPT
iptables -A OUTPUT -o ext_if -p tcp --sport 1024: --dport 53 \
    -m state --state NEW -j ACCEPT

Replace int_if and ext_if with internal and external interface names 
(eth0, eth1, ppp0, or whatever else you have).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

