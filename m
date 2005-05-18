From: Jason Opperisano <opie@817west.com>
Subject: Re: Host blocking
Date: Wed, 18 May 2005 11:08:26 -0400
Message-ID: <20050518150826.GA4863@bender.817west.com>
References: <003b01c55acb$841114a0$f00aa9c0@winxp>
	<20050517131415.GA844@bender.817west.com>
	<000901c55b78$87815390$f00aa9c0@winxp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000901c55b78$87815390$f00aa9c0@winxp>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, May 18, 2005 at 10:09:27AM +0300, Wennie V. Lagmay wrote:
> Hi Jason,
> 
> I try the the configuration and it is not working the way I want, maybe I 
> need to elaborate my config.
> 
> The 1st linux server is the firewall:  It do forwarding, firewalling and 
> natting it has 2 NIC card. The 1st NIC card IP is 203.172.xxx.97 / 30 which 
> is connected to the internet , The 2nd NIC card is 203.172.xxx.105 / 28 
> connected to LAN. local IP block for the clients 192.168.10.0/24 which is 
> NAtted to 203.172.xxx.112-114.
> 
> The second is a linux server is a proxy server: It also have 2 NIC card. 
> 1st NIC card is 203.172.xxx.102 /30 which is connected to the internet, the 
> 2nd NIC card is 203.172.xxx.106 / 28 connected to LAN.
> 
> The process work like this: a client with ip address 192.168.10.2 wants to 
> connect to the internet it will pass through firewall, the firewall then 
> forward it to proxy and the will get the page then return it back to the 
> client. in this case no natting is involve. the proxy server gets the page 
> by its ip address then return it to 192.168.10.2. On the other hand if the 
> same client want to chat, it will go to firewall, the firewall then 
> translate the ip 192.168.10.2 to 203.172.xxx.112 then the client can chat.
> 
> Our system work this way, As I mention they client can define our own proxy 
> or our ISP's proxy, But I want every body to use our own proxy becaus we 
> have dalay_pool.

k--slight modification of previous rules:

  # allow internal machines to connect to our proxy
  iptables -A FORWARD -p tcp --syn -s 192.168.10.0/24 \
    -d $OUR_PROXY_IP --dport $PROXY_PORT -j ACCEPT

  # drop packets from inside net to ISP Proxy
  iptables -A FORWARD -p tcp --syn -s 192.168.10.0/24 \
    -d $ISP_PROXY_IP -j DROP

if your FORWARD policy is set to DROP, and you only allow specific
services through the firewall from the internal network, keeping your
users from connecting to things they shouldn't connect to becomes much
easier.

-j

--
"Black Knight: You see kids? Your father's nothing but a fizzle!
 Peter: Hey, pal, nobody calls me a fizzle and gets away with it! Except
 for that one guy who called me a fizzle and then he ran off. But
 nobody else has ever called me a fizzle and got away with it! Actually
 though, he was the only one who ever called me a fizzle. But after
 today, only half the people who've called me a fizzle will have gotten
 away with it!"
        --Family Guy

