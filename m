From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Home web server using front firewall
Date: Wed, 17 Dec 2003 22:48:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312172248.50303.Antony@Soft-Solutions.co.uk>
References: <HFEBJMKNPOCPPMGFHDMCAEJBCDAA.esanz@minorplanetusa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HFEBJMKNPOCPPMGFHDMCAEJBCDAA.esanz@minorplanetusa.com>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Wednesday 17 December 2003 9:30 pm, Erick Sanz wrote:

> Antony,
>
> This are the entries I had to add to make it work:
>
> iptables -P INPUT   DROP
> iptables -P OUTPUT  DROP
> iptables -P FORWARD DROP
>
> iptables -t nat -A PREROUTING -p tcp -d 172.16.1.33 --dport 80 \
> 	-j DNAT --to 10.10.1.240
>
> iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE
>
> iptables -A INPUT -i eth0 -p tcp -d 172.16.1.33 --dport 80 -m state \
> 	--state NEW,ESTABLISHED,RELATED -j ACCEPT
>
> iptables -A INPUT -i eth1 -p tcp -s 10.10.1.240 --sport 80 -m state \
> 	--state ESTABLISHED,RELATED -j ACCEPT

Packets being routed through a firewall from one side to the other do not go 
through the INPUT chain.

The only packets which go through rules in the INPUT chain are those addressed 
to the firewall itself, and not being routed any further.

I do not believe you need the above two rules in the INPUT chain.

> I have read the FAQ on forwarding; however, I can still not understand
> the 3 forwarding statements needed; one of them is for input on eth0
> (172.16.1.33) to 10.10.1.240.  The other one is for data received from
> eth1 (10.10.1.240); however, I don't understand the third forward (can't
> be taken out as it won't work then)... I see the difference as -i to
> -o ... Is there a newby explanation on why?

You need to understand the difference between putting a rule in the INPUT 
chain (which is for packets addressed to the firewall itself), compared to 
specifying -i in a rule in the FORWARD chain (which is for packets being 
routed through the firewall, where you want to specify which interface they 
entered the machine through).

Here's a suggestion:

Allow your firewall to pass some of the traffic that you want (now that you've 
got it working), and then type:

iptables -L -n -v -x

You will see each of the rules in the INPUT, FORWARD and OUTPUT rules, with 
byte and packet counts at the beginning.

Any rule which has a zero packet / byte count has not seen any traffic, and is 
therefore not contributing to your firewall working.

Hopefully this helps to explain things a bit more so you understand what is 
needed and what is not.

Antony.

-- 
This is not a rehearsal.
This is Real Life.


