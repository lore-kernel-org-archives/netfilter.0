From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help Redirect
Date: Wed, 6 Nov 2002 17:44:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211061745.gA6Hj5e21400@vulcan.rissington.net>
References: <F34hmjdyl6ds7s07Bj8000025dd@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F34hmjdyl6ds7s07Bj8000025dd@hotmail.com>
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

On Wednesday 06 November 2002 4:34 pm, Linux User wrote:

> Hi friends,
>
> My consultation is the following one:
>
> What rules (IPTABLES) in firewall I can apply so that all the requirement
> of the internal network to port 80 is redirected to an external Squid Proxy
> server (3128) .
>
> Firewall:
> Eth0 (External): 192.168.100.1
> Eth1 (Internal):   172.16.100.1
>
> Squid Proxy Server:
> Eth0 : 192.168.100.100

iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 80 -j DNAT --to 
192.168.100.100:3128
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth1 -p tcp --dport 3128 -d 192.168.100.100 -j ACCEPT

Antony.

-- 

Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Nobel Prizewinner in Physics

