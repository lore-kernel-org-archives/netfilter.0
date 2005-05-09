From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: port and adress forward
Date: Mon, 09 May 2005 13:28:32 -0500
Message-ID: <427FABD0.6070602@riverviewtech.net>
References: <427F7554.4000107@dud.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427F7554.4000107@dud.com.br>
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

> I have a web and mail server in my local lan with ip 192.168.0.x and I 
> have a firewall / gateway with valid address.  I have a policy a to 
> redirect port 80 to my internal server. But I try to access my website 
> inside my internal lan and doesn't access.
> 
> My chain is below:
> 
>  iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT 
> --to-dest 192.168.0.X
>  iptables -A FORWARD -p tcp -i eth0 --dport 80 -d 192.168.0.X -j ACCEPT

Add a rule to your nat table like this:

iptables -t nat -A PREROUTING -i eth1 -s 192.168.0.0/24 -d $External_IP_Address_of_your_firewall -p tcp --dport 80 -j DNAT --to-destination 192.168.0.x
iptables -t nat -A POSTROUTING -o eth1 -s 192.168.0.0/24 -d 192.168.0.x -p tcp --dport 80 -j SNAT --to-source $Internal_IP_Address_of_your_firewall
iptables -A FORWARD -p tcp -i eth1 -o eth1 -d 192.168.0.x --dport 80 -j ACCEPT

This will DNAT any traffic coming from your LAN that is directed at the external IP of your firewall for your web server to go directly to the web server in house.  The likely reason that things are not working for you now is that the external IP of your firewall / router is directly accessible from the firewall / router its self and thus the traffic will not (logically) go out the internet connection and back in and pass through your other DNAT / related rules.



Grant. . . .

