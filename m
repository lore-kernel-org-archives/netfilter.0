From: adderek <adderek@polbox.com>
Subject: Re: rules suggestion
Date: Thu, 22 Jul 2004 08:16:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FF5BA8.2040900@polbox.com>
References: <a0f69e50407212243efa02aa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e50407212243efa02aa@mail.gmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Askar Ali Khan <askarali@gmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Askar Ali Khan wrote:

> Here are few rules from overs firewall, please let me know is this is
> the proper way to deal with windowz ports :)
> 
> iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -A INPUT -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -A FORWARD -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -A FORWARD -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -t nat -A PREROUTING -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -t nat -A PREROUTING -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP


$ipt -t filter -A OUTPUT -o $extif_name -p udp -d 192.168.1.255 --dport 
137:139 -j DROP  #NETBIOS

$ipt -t filter -A INPUT -i $extif_name -p udp -d 192.168.1.255 --dport 
137:139 -j DROP  #NETBIOS

$ipt -t filter -A FORWARD -i $extif_name -p udp -d 192.168.1.255 --dport 
137:139 -j DROP  #NETBIOS

$ipt -t filter -A FORWARD -o $extif_name -p udp -d 192.168.1.255 --dport 
137:139 -j DROP  #NETBIOS



This will do (at least it works on my PC :)

I have 192.168.1.x subnet.

# NETBIOS is my comment (first two lines are taken from my bash's script 
and lines 3 and 4 are not tested and I've created them by hand a while 
ago). However I've disabled multicast forwarding on my router/firewall 
so only first two lines are really needed (on my PC).

However if you like to enable SMB then some more ports will be needed 
(ie. 32768 or someting like that, and this one port is undocumented)


