From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: Re: Host blocking
Date: Wed, 18 May 2005 10:09:27 +0300
Message-ID: <000901c55b78$87815390$f00aa9c0@winxp>
References: <003b01c55acb$841114a0$f00aa9c0@winxp>
	<20050517131415.GA844@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Hi Jason,

I try the the configuration and it is not working the way I want, maybe I 
need to elaborate my config.

The 1st linux server is the firewall:  It do forwarding, firewalling and 
natting it has 2 NIC card. The 1st NIC card IP is 203.172.xxx.97 / 30 which 
is connected to the internet , The 2nd NIC card is 203.172.xxx.105 / 28 
connected to LAN. local IP block for the clients 192.168.10.0/24 which is 
NAtted to 203.172.xxx.112-114.

The second is a linux server is a proxy server: It also have 2 NIC card. 1st 
NIC card is 203.172.xxx.102 /30 which is connected to the internet, the 2nd 
NIC card is 203.172.xxx.106 / 28 connected to LAN.

The process work like this: a client with ip address 192.168.10.2 wants to 
connect to the internet it will pass through firewall, the firewall then 
forward it to proxy and the will get the page then return it back to the 
client. in this case no natting is involve. the proxy server gets the page 
by its ip address then return it to 192.168.10.2. On the other hand if the 
same client want to chat, it will go to firewall, the firewall then 
translate the ip 192.168.10.2 to 203.172.xxx.112 then the client can chat.

Our system work this way, As I mention they client can define our own proxy 
or our ISP's proxy, But I want every body to use our own proxy becaus we 
have dalay_pool.

the objective is to disable ISP proxy to the client so that they are force 
to use our own proxy server.

Thank you very much,

Wennie

----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, May 17, 2005 4:14 PM
Subject: Re: Host blocking


> On Tue, May 17, 2005 at 01:30:58PM +0300, Wennie V. Lagmay wrote:
>> Our ISP's Proxy server is proxy.ISP.net , our company's own proxy server 
>> is
>> proxy.ourcompany.net. Our own proxy server has delay_pool but our ISP 
>> proxy
>> server dont have. I want to control our client to use only our company
>> proxy server. how can I block the proxy.ISP.net using IP tables so that
>> every body can be force to use our compnay proxy server. (note that our
>> company proxy server is connected to our ISP proxy server as cache_peer
>> parent)
>
> assuming your company proxy server is on a different machine than the
> firewall:
>
>
>  iptables -A FORWARD -p tcp --syn -s proxy.ourcompany.net \
>    -d proxy.ISP.net --dport $PROXY_PORT -j ACCEPT
>
>  # assuming your internal machines are allowed unfettered access
>  # to the internet
>
>  iptables -A FORWARD -p tcp --syn -d proxy.ISP.net -j DROP
>
> -j
>
> --
> "Guy on Street #2: It's 3:00. Where the hell is Louie?
> Guy on Street #1: Well, you tell me. Louie left his house at 2:15 and
> had to travel a distance 6.2 miles traveling at a rate of five miles a
> hour. When will Louie get here?
> Guy On Street #2: Depends if he stops to see his ho.
> Guy on Street #1: That's what we call a "variable"."
>        --Family Guy
> 


