From: Joseph Sirucka <jsirucka@connectingyou.com.au>
Subject: Re: blocking ports outbound
Date: Thu, 13 Mar 2003 07:15:37 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E6F9569.5030108@connectingyou.com.au>
References: <FD8F124A387AD6119F7900A0D218B321019C41@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------070403050507060405080009"
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org


--------------070403050507060405080009
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Maybe I got my question wrong.

I'm very new to iptables coming from a ipfilter background. In ipfilter 
I just state block all in and then open the ports I wish to allow 
through. Is there something similiar in iptables.

I wish to stop the outside world from seeing the ports upon the 
firewall/proxy and beyond into my internal network.

My problem is I cannot join certain irc servers due to there open proxy 
policy.

So really how do I block all ports internally while allowing a something 
like a connection internally to go outbound and recieve the packets back.

My current iptables config is

> #!/bin/bash
> /bin/echo "Firewall rules starting up now..."
> /sbin/modprobe ipt_MASQUERADE
> /usr/local/sbin/iptables -F
> /usr/local/sbin/iptables -t nat
> /usr/local/sbin/iptables -t mangle -F
> /usr/local/sbin/iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> /bin/echo 1 > /proc/sys/net/ipv4/ip_forward
> /usr/local/sbin/iptables -A OUTPUT --dport 3128 -j DENY
> /usr/local/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 
> 80 -j REDIRECT --to-port 3128
> /usr/local/sbin/iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 
> 80 -j REDIRECT --to-port 3128

Pl,ease pick apart my rules and tell me what I'm doing wrong.

As I stated, I'm a complete newbie to iptables.

My system is a firewall/proxy unit with a adsl connection running pppoe 
to the outside world. I recieve a permanent ip upon te ppp0 interface.

I hope I make some sense.

thanks

Joseph

Rob Sterenborg wrote:

>>I would like to know the rule to block ports outbound.
>>
>>I am trying to block port 3128 my squid/proxy port.
>>    
>>
>
>Soo, ehm, you want to prevent outbound packets from squid ?
>If you don't want that squid is sending packets, then why start squid at
>all.
>
>Well, if that's what you really want to :
>iptables -A OUTPUT -p tcp --sport 3128 -j REJECT --reject-with tcp-reset
>or simply
>iptables -A OUTPUT -p tcp --sport 3128 -j DROP
>
>
>Or don't you want users from the outside (internet) to connect ?
>
># Drops everything by default
>iptables -P INPUT DROP
>
># Accepts anything coming in on your LAN interface,
># but you may want something more secure.
>iptables -A INPUT -i <if_lan> -j ACCEPT
>
>
>Rob
>
>
>  
>


--------------070403050507060405080009
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
Hi <br>
<br>
Maybe I got my question wrong.<br>
<br>
I'm very new to iptables coming from a ipfilter background. In ipfilter I
just state block all in and then open the ports I wish to allow through.
Is there something similiar in iptables.<br>
<br>
I wish to stop the outside world from seeing the ports upon the firewall/proxy
and beyond into my internal network.<br>
<br>
My problem is I cannot join certain irc servers due to there open proxy policy.<br>
<br>
So really how do I block all ports internally while allowing a something
like a connection internally to go outbound and recieve the packets back.<br>
<br>
My current iptables config is<br>
<br>
<blockquote type="cite">#!/bin/bash<br>
/bin/echo "Firewall rules starting up now..."<br>
/sbin/modprobe ipt_MASQUERADE<br>
/usr/local/sbin/iptables -F<br>
/usr/local/sbin/iptables -t nat<br>
/usr/local/sbin/iptables -t mangle -F<br>
/usr/local/sbin/iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE<br>
/bin/echo 1 &gt; /proc/sys/net/ipv4/ip_forward<br>
/usr/local/sbin/iptables -A OUTPUT --dport 3128 -j DENY<br>
/usr/local/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
REDIRECT --to-port 3128<br>
/usr/local/sbin/iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 80 -j
REDIRECT --to-port 3128<br>
</blockquote>
Pl,ease pick apart my rules and tell me what I'm doing wrong.<br>
<br>
As I stated, I'm a complete newbie to iptables.<br>
<br>
My system is a firewall/proxy unit with a adsl connection running pppoe to
the outside world. I recieve a permanent ip upon te ppp0 interface.<br>
<br>
I hope I make some sense.<br>
<br>
thanks <br>
<br>
Joseph<br>
<br>
Rob Sterenborg wrote:<br>
<blockquote type="cite"
 cite="midFD8F124A387AD6119F7900A0D218B321019C41@hslex01.hslbz.local">
  <blockquote type="cite">
    <pre wrap="">I would like to know the rule to block ports outbound.

I am trying to block port 3128 my squid/proxy port.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Soo, ehm, you want to prevent outbound packets from squid ?
If you don't want that squid is sending packets, then why start squid at
all.

Well, if that's what you really want to :
iptables -A OUTPUT -p tcp --sport 3128 -j REJECT --reject-with tcp-reset
or simply
iptables -A OUTPUT -p tcp --sport 3128 -j DROP


Or don't you want users from the outside (internet) to connect ?

# Drops everything by default
iptables -P INPUT DROP

# Accepts anything coming in on your LAN interface,
# but you may want something more secure.
iptables -A INPUT -i &lt;if_lan&gt; -j ACCEPT


Rob


  </pre>
</blockquote>
<br>
</body>
</html>

--------------070403050507060405080009--


