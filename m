From: Boryan Yotov <yotov@prosyst.com>
Subject: Re: Why would these rules cause errors only sometimes?
Date: Thu, 24 Oct 2002 09:59:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DB7A848.50201@prosyst.com>
References: <20021024044638.87841.qmail@web40707.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Tasha Smith <natasha3641@yahoo.com>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Sorry I didn't read your mail until the end :)
Concerning the dynamic IP address a little trick should do the work 
until you got "pump" working:

in your /etc/rc.d/rc.iptables or whatever shell script you use to setup 
your firewall you could use the following to retrieve you ipaddress:

#!/bin/sh
....
#The following could work for ppp device as well just change it a little :)
eth0_address=`ifconfig eth0 | grep "inet addr" | awk '{print $2}' | sed 
's/addr://'`

....
#And simple rule should look like:
iptables -A INPUT -p tcp -d $eth0_address --dport 80 -j REJECT 
--reject-with tcp-reset

Note: of course you need to restart your firewall rules after you gain a 
new IP address on that interface but atleast you don't need to edit your 
rules again :)

Tasha Smith wrote:

>Hiii,
>
>Can someone tell me why these rules will only casue errors "sometimes"? I ran my
>script before and it worked fine. But then i added a few more log polocies
>and drop rules and then i get errors. I know its these rules casue when i #
>commented them out the script it ran properly again and it happened before but
>it fixed itself somehow. Here are the rules that are casue the error:
>
>iptables -A OUPUT -o eth0 -p tcp \
>         -s eth0 --sport 1024:65535 \
>         --dport 80 -j ACCEPT
>iptables -A INPUT -i eth0 -p tcp \
>         --sport 80 \
>         -d eth0 --dport 1024:65535 -j ACCEPT
>
>
>iptables -A INPUT -i eth0 -p udp \
>         -s 122.xx.xxx.xx  --sport 67 \
>         --dport 68 -j ACCEPT
>iptables -A OUTPUT -o eth0 -p udp \
>         -s eth0 --sport 68 \
>         -d 122.xx.xxx.xx --dport 67 -j ACCEPT
>
>
>Here the error i get:
>iptables v1.2.7a: host/network  `eth0' not found
>Try iptables `iptables -h' or `iptables --help for more infomation'
>iptables v1.2.7a: host/network  `eth0' not found
>Try iptables `iptables -h' or `iptables --help for more infomation'
>iptables v1.2.7a: host/network  `eth0' not found
>Try iptables `iptables -h' or `iptables --help for more infomation'
>
>Here are the rules i added and they work fine when i comment out the above
>rules!
>iptables -t nat --policy PREROUTING -j DROP
>iptables -t nat --policy OUPUT -j DROP
>iptables -t nat --policy POSTROUTING -j DROP
>
>
>how can i fix this? thanks guys! i have a dynamic ip address and i cant get pump
>to work thats why i using eth0 instaead of an IP adress! 
>
>
>__________________________________________________
>Do you Yahoo!?
>Y! Web Hosting - Let the expert host your web site
>http://webhosting.yahoo.com/
>
>
>
>  
>




