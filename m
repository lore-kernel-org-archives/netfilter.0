From: Pavlos Parissis <p_pavlos@freemail.gr>
Subject: Re: Netfilter 1.2.7a (debian), rule (DNAT) problems
Date: Sun, 24 Nov 2002 14:58:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021124145857.6085bb2c.p_pavlos@freemail.gr>
References: <5.1.1.6.0.20021113172900.00bb9ae8@olga.swip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.1.6.0.20021113172900.00bb9ae8@olga.swip.net>
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

On Wed, 13 Nov 2002 17:41:57 +0100 040 <madmac@swipnet.se> wrote:
>  Hello.
> 
>  Now I want to add a rule to forward all incoming data on port 4662 (TCP)
>  
>  from the internet (eth1) to
>  a server on my LAN, namely host 192.168.0.7 (via eth0), so I add the 
>  following rule (under *nat):
>  -A PREROUTING -p tcp -m tcp -i eth1 --dport 4662 -j DNAT
>  --to-destination 192.168.0.7:4662
You have to add rules in FORWARD CHAIN.
iptables -A FORWARD -p tcp -i eth1 -o eth0 -d 192.168.0.7 --dport 4662 -j
ACCEPT

iptables -A FORWARD -p tcp -i eth0 -o eth1 -s 192.168.0.7 --sport 4662 -j
ACCEPT

PAvlos

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I love having the feeling of being in control
while i have the sensation of speed

The surfer of life
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


