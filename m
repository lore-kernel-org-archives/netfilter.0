From: Techside Security <security@techside.it>
Subject: Re: 2 Internet connection and one local network
Date: Wed, 10 Jan 2007 15:43:37 +0100
Message-ID: <45A4FB99.1000307@techside.it>
References: <117F5E7DA31C17478948DC39E01B948B400F98@frost.PlumSoftwareLtd.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <117F5E7DA31C17478948DC39E01B948B400F98@frost.PlumSoftwareLtd.local>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi.

Unfortunately all server have set the default gw to the internal ip of 
the firewall...
With tcpdump seems that the packet don't reach the internal server but
reach the external ethernet of the firewall (this sounds very strange....)


ping rqst -----> PUBLIC IP1 ----> |FRW|  --\  \--- internal srv
(this don't work)

ping rqst -----> PUBLIC IP2 (default gw) ----> |FRW|  ----> internal srv
(this work)

My configuration is little different about yours; i nat entire server IP 
  not only port from the 2 isp lines.

Now the only way to use the new line for all the service (except sigh 
the servers) is to setup the default gw to the new router and to 
maintain the old line with the server (now all the service use this old
public ip) whith the rule:

ip rule add from <internalsrvip> table oldline


If I delete this rule the server respond to the new line but not respond 
to the call from the old line.

thks.

Matt ha scritto:
> Hi.
> 
> The default gateway on your internal servers should point to the internal IP of the linux firewall box. It sounds to me that you've set the default gateway to the public IP of one of your internet lines - doing this will certainly stop it from working.
> 
> This configuration should remember what internet line the packet arrived at, and when the reply from the internal server arrives back at the linux box, it should be routed back out the same internet line it arrived at.
> 
> Hope that helps,
> 
> Matt
> 
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Techside
> Security
> Sent: 09 January 2007 08:28
> To: netfilter@lists.netfilter.org
> Subject: RE: 2 Internet connection and one local network
> 
> 
> Hi, this configuration don't work for me.
> I have traced the packet that arrive from internet to a internal server;
> when the packet is sended to public ip that corrspond to default 
> internet line all is ok, but when i send a packet to public ip that 
> correspond to second internet line the packet arrive to firewall and
> don't go forward to internal server. This seems to be an nat or 
> forwarding error but I if add the table rule (iproute2)
> ip rule add from <internal server ip> table line2
> the packet go to server and return from the second line.
> All the test is made with the iptables and iproute rule
> described in the reply post.
> 
> What is the meaning of: echo 0 > /proc/sys/net/ipv4/conf/eth1/rp_filter
> 
> I'm using debian sarge with 2.6.17 kernel and iptables 1.3.7
> 
> Any suggestion on what I'm wrong ?
> 
> Sorry for my bad english.
> Fabio.
> 

