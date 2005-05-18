From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Route back
Date: Wed, 18 May 2005 09:33:07 -0500
Message-ID: <428B5223.6000604@riverviewtech.net>
References: <000601c55b0a$e4949330$6701a8c0@LeoNB>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000601c55b0a$e4949330$6701a8c0@LeoNB>
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

> I have a network with Windows 2k3 server inside connecting to a Linux Firewall. I setup the iptables to masquerade. Works fine. The firewall also pass web request to the 2k3 from the internet side.
> 
> But if I want use IE to browse back the webserver in the internal network. It fails.
> 
> Internet ---- (WAN IP) Linux Firewall (192.168.3.2) ---- (192.168.3.103) win2k3
> 
> The iptables rule file is :
> 
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> :UA-ACCEPT - [0:0]
> -A INPUT -j UA-ACCEPT
> -A UA-ACCEPT -i lo -j ACCEPT
> -A UA-ACCEPT -i eth1 -p tcp --dport 22 -j ACCEPT
> -A UA-ACCEPT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A UA-ACCEPT -j REJECT --reject-with icmp-host-prohibited
> -A FORWARD -p tcp -m tcp -m state --state ESTABLISHED,RELATED --dport 80 -j ACCEPT
> COMMIT
> 
> *nat
> :PREROUTING ACCEPT [0:0]
> :POSTROUTING ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to 192.168.3.103
> -A POSTROUTING -o eth0 -j MASQUERADE
> 
> I also tried to put :
> 
> iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 -j DNAT --to 192.168.3.103 where 1.2.3.4 assumed to be WANIP 
> 
> Also failed.
> Any clue?

I'm going to presume that the IE that you are talking about is on the 2k3 server it's self.  If that is indeed the case and you are trying to browse to the WAN IP of your router you will never get in with the rules that you have.  This is because when your try to connect to the WAN IP via IE your traffic will go to your Linux router which will see the request for the WAN IP come in on it's internal side and go to the directly connected IP and not go out and back in the external interface.  To get around this you need to do one of two things, 1) take the inbound interface match off your PREROUTING rule or 2) add a second PREROUTING rule similar to what you do have but checking on the eth1 inbound interface.



Grant. . . .

