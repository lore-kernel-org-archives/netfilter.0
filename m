From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Can't get DNS forwarded
Date: Wed, 25 Sep 2002 20:07:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020925190737.TLLD2092.mta07-svc.ntlworld.com@there>
References: <76135A08B685D411A40F00A0C9D7C941CFF165@FS02>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <76135A08B685D411A40F00A0C9D7C941CFF165@FS02>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Wednesday 25 September 2002 7:32 pm, Joshua Cragun wrote:

> # Allow DNS requests from LAN
> echo -n "Allowing DNS requests..."
> #iptables -A FORWARD -i eth0 -s 192.100.0/24 -p tcp --sport 1023:65535
> --dport 53 -j ACCEPT
> #iptables -A FORWARD -i eth1 -d 192.100.0/24 -p tcp --sport 53 --dport
> 1023:65535 -j ACCEPT
> #iptables -A FORWARD -i eth0 -s 192.100.0/24 -p udp --sport 1023:65535
> --dport 53 -j ACCEPT
> #iptables -A FORWARD -i eth1 -d 192.100.0/24 -p udp --sport 53 --dport
> 1023:65535 -j ACCEPT
> iptables -A FORWARD -p udp --sport 53 -j ACCEPT
> iptables -A FORWARD -p udp --dport 1023:65535 -j ACCEPT
> iptables -A FORWARD -p tcp --sport 53 -j ACCEPT
> iptables -A FORWARD -p tcp --dport 1023:65535 -j ACCEPT

You should be allowing traffic *to* dport 53, not *from* sport 53...

I would suggest the following:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -o eth1 -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -o eth1 -p udp --dport 53 -j ACCEPT

Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.

