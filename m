From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: REJECT doesnt work
Date: Tue, 19 Jun 2007 14:24:17 +0200
Message-ID: <003601c7b26c$c1d25e70$0b0ffe0a@NS006819>
References: <34b8543c0706182222i307aa705y6e705857428eb9ee@mail.gmail.com><01c501c7b236$54be1530$0b0ffe0a@NS006819><34b8543c0706190127h41d80c97yec8606b03f72a7f1@mail.gmail.com><003001c7b256$dd268810$0b0ffe0a@NS006819>
	<34b8543c0706190321w4fcd43e7yfa6a4a1308def5f9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <34b8543c0706190321w4fcd43e7yfa6a4a1308def5f9@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

>> Well, this rule generates no error for me. Doesn't it for you?
> 
> no for me it returns error
> here is my iptables config file

Perhaps you don't have the ipt_REJECT.o or ipt_REJECT.ko module
(loaded).
To check if ipt_REJECT is installed:

# locate ipt_REJECT

To check if ipt_REJECT is loaded:

# lsmod|grep ipt
[...]
ipt_REJECT              7808  4 
[...]

> *nat
> :PREROUTING ACCEPT [831:64633]
> :POSTROUTING ACCEPT [20:1927]
> :OUTPUT ACCEPT [11:1333]
> 
> -A POSTROUTING -s 192.168.0.157 -o eth1 -j MASQUERADE
> -A INPUT -s 192.168.0.157 -m mac --mac-source !
> 00:11:2F:29:96:84 -j REJECT
> COMMIT
> 
> I dont know what is wrong with it !!! I want define a rule if the IP
> 192.168.0.157 is cloned then reject its packets. but when restarting
> the iptables it will fail 

What errors?

> I've seen another configuration in internet and I think it will
> fulfill my needs but I dont understand it, would you take a look at
> this and tell me what it means:
> -----------------------
> *filter
> :FORWARD DROP [0:0]
> :INPUT DROP [0:0]
> :OUTPUT ACCEPT [0:0]
> :mac - [0:0]
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -i lo -j ACCEPT
> -A FORWARD -j mac
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i eth1 -m state --state NEW -j ACCEPT
> -A mac -i eth1 -s 1.2.3.4 -m mac --mac-source
> 00:01:02:03:04:05 -j RETURN
> -A mac -i eth1 -s 1.2.4.8 -m mac --mac-source
> 00:01:04:04:08:10 -j RETURN
> -A mac -i eth0 -m mac --mac-source 00:0a:bc:dc:ba:98 -j RETURN
> -A mac -j LOG --log-prefix "Invalid MAC "
> -A mac -j DROP
> COMMIT
> ----------------------
> 
> I dont understand what RETURN means??

You can see that all packets in the FORWARD chain are redirected to the
mac chain. In the mac chain a few tests are performed. If a test
matches, the packet is RETURN-ed to the chain is was called from (in
this case the FORWARD chain) and it will continue traversing the FORWARD
chain. If the packet didn't match any rule in the mac chain, it will be
logged and dropped.

See also: man iptables, the TARGETS section.


Grts,
Rob



