From: "Erick Sanz" <esanz@minorplanetusa.com>
Subject: Home web server using front firewall
Date: Wed, 10 Dec 2003 17:24:41 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HFEBJMKNPOCPPMGFHDMCOECACDAA.esanz@minorplanetusa.com>
References: <Pine.LNX.4.44.0312101542130.2784-100000@sparrow>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0312101542130.2784-100000@sparrow>
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


All,

I am trying to install a small web server at home in order
to display some family pictures and some other personal
topics (hobbies, interests ...)

I would like to have the following configuration:


	Static IP -------- Linux    --------- Real web server
	SBC ADSL	       Firewall       
	            eth0              eth1
	63.5.5.5				        10.10.1.5

For this I need port forwarding and probably NAT to change
the outgoing IP address.

I want the real server to be completely blocked for
any other port than http and https on the web server 
(I am planning to accept requests only from the internal 
network).
 
If you can shed some light on the port forwarding part,
I think I can tackle the rest.  I believe it would be
something like this:

    iptables -P INPUT   DROP
    iptables -P OUTPUT  DROP
    iptables -P FORWARD DROP

    iptables -t nat -A PREROUTING -p tcp -d 63.5.5.5 \
    --dport 80 -j DNAT --to 10.10.1.5

    iptables -t nat -A PREROUTING -p tcp -d 63.5.5.5 \
    --dport 443 -j DNAT --to 10.10.1.5

    iptables -A FORWARD -i eth1 -s 10.10.1.0/24 --sport 80 \
    -j ACCEPT

    iptables -A FORWARD -i eth1 -s 10.10.1.0/24 --sport 443 \
    -j ACCEPT

    iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE


I am already dropping all malformed packets before this
entries, so nmap and nessus should not be able to do attacks;
they will be able to tell there is a web server there,
but that is all.

Also, I am planning to use syn_cookies to avoid DoS attacks.

Am I forgetting anything else?

Beforehand, thank you for your help.

PS. if someone has something like this working, could you
please send me your config?



