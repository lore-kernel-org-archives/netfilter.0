From: Primero <primero@fastwebnet.it>
Subject: Re: problem with VPN and iptables redirect
Date: Wed, 16 Jun 2004 20:22:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040616202240.6e3d6912@Zapata.homenetwork>
References: <1087373437.1085.1.camel@akasha.fib.upc.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1087373437.1085.1.camel@akasha.fib.upc.es>
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

On Wed, 16 Jun 2004 10:10:37 +0200
sandra hernandez <sandra@fib.upc.es> wrote:

> 
> The problem is when I execute this command with iptables in linux box:
>   iptables -t nat -I PREROUTING 1 -d x.x.x.x -j REDIRECT --to-port 80
>    (and all the policies are to ALLOW)
> The redirection fails...
> If I deactivate VPN, the redirection works ok.
Hi Sandra.

I'm not so experted but if you would give us more info everything would be simple :)

What about your IPsec Configuration?
What About the rest of iptables script?

Think about that if you want to redirect the connection when unecripted and you're using "transport Mode", or tunnel mode without change of address beetween clear and unecrypted connection you could have problems ... like you have :)

Why don't you try something like this? 

First Mark all packets that arrives Encrypted.

iptables -t mangle -I PREROUTING 1 -p 50 (or 51 if you use ah) -d X.X.X.X -j MARK --set-mark 10

This way all Encrypted packets are marked with a number that will remain also when they'll get Unencrypted and your IPSEC will think about authentication. After that the packets are unecrypted they will start a new "walk" in netfilter Chains, so you can redirect all marked packets

iptables -t nat -I PREROUTING 2 -m mark 10 -j REDIRECT --to-port 80


Don't know, but it could work. 

Bye



