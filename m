From: Pascal Vilarem <pascal.vilarem@9online.fr>
Subject: Re: iptables ceases to work after night
Date: Thu, 11 Sep 2003 12:55:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F6054B0.9020501@9online.fr>
References: <E19xL7G-000NJQ-00.varyag18-mail-ru@f10.mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E19xL7G-000NJQ-00.varyag18-mail-ru@f10.mail.ru>
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
To: netfilter@lists.netfilter.org

what does iptables-save returns on the morning ?

is it different from what it returns when forwarding is ok ?

if you find differences... there is something to find that alter 
netfilter config
(a firewall script ? something like an iptables-restore script ?)

if you don't find differences :

check to see if resetting netfiler and giving again the config is enough...
if yes... i'd suggest to update netfilter an perhaps the kernel...

stop netfilter and check if something can go through your netcard...
if no... i'd suggest to check the driver of the netcard... and perhaps 
the netcard itself.

hope this can help,
Pascal


Vladimir Potapov wrote:

>Yesterday at evening my packet filter with iptables worked fine.Today at morning , I see that he don't forwarding packet from DMZ to local and back.And this thing I see every morning.After I reboot my machine it's work fine.I think that my 3com cards have some bugs.In log there no entries about this . My rules is:
>
>
>#Allow from local to DMZ and back
>
>
>-A FORWARD -d 192.168.1.0/255.255.255.0 -i eth1 -o eth2 -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT 
>
>-A FORWARD -d 192.168.5.0/255.255.255.0 -i eth2 -o eth1 -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
>
>-A FORWARD -s 192.168.1.0/255.255.255.0 -d 192.168.5.0/255.255.255.0 -i eth2 -o eth1 -p tcp -m tcp --dport 80 --tcp-flags SYN,RST,ACK SYN -m state --state NEW -j ACCEPT
>
>-A FORWARD -s 192.168.1.0/255.255.255.0 -d 192.168.5.0/255.255.255.0 -i eth2 -o eth1 -p tcp -m tcp --dport 3128 --tcp-flags SYN,RST,ACK SYN -m state --state NEW -j ACCEPT
>
>-A FORWARD -s 192.168.1.0/255.255.255.0 -d 192.168.5.0/255.255.255.0 -i eth2 -o eth1 -p tcp -m tcp --dport 25 --tcp-flags SYN,RST,ACK SYN -m state --state NEW -j ACCEPT
>
>-A FORWARD -s 192.168.1.0/255.255.255.0 -d 192.168.5.0/255.255.255.0 -i eth2 -o eth1 -p tcp -m tcp --dport 110 --tcp-flags SYN,RST,ACK SYN -m state --state NEW -j ACCEPT
>
>
>
>  
>


