From: "John Jones" <jjones@merlintechnologies.com>
Subject: RE: Help needed understanding what I am doing wrong.
Date: Mon, 3 Jun 2002 14:09:14 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <002a01c20b42$ea39aa70$6301a8c0@JJONES1>
References: <005801c20b32$3e913810$c764a8c0@aldoxp>
Reply-To: <jjones@merlintechnologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <005801c20b32$3e913810$c764a8c0@aldoxp>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Iptables' <netfilter@lists.samba.org>

Okay, with Aldo's 2nd email (sent to me) advice:

> You should not need the return rules if you have rules like 
> these: iptables -A FORWARD -m state --state 
> ESTABLISHED,RELATED -j ACCEPT
> 
> The ESTABLISHED,RELATED allows a path for return packets.
> 
> If your nslookup times out, then it may be your aliases - is 
> that still setup?
> 
> Typically your best bet is to allow everything at first, then 
> tighten things down as your understanding increases - Try 
> tcpdumps on the outside interface while you attempt your 
> nslookup - you should see the port 53 requests...

At first, running his suggested rule was returning errors.  I suspected
kernel configuration issues... So I went back in, enabled everything for
IPTABLES and recompiled. So, now the command works, and the entire
firewall ruleset (from first to last) follows:

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp -d 10.0.0.10 --dport 53 -j ACCEPT
iptables -A FORWARD -p udp -d 10.0.0.10 --dport 53 -j ACCEPT
iptables -t nat -I PREROUTING 1 -p tcp -d 66.38.133.120 --dport 53 -j
DNAT --to 10.0.0.10:53
iptables -t nat -I PREROUTING 1 -p udp -d 66.38.133.120 --sport 53 -j
DNAT --to 10.0.0.10:53


--------------------------

[gemini:~] tcpdump -pq -i eth1 port 53
tcpdump: listening on eth1
13:56:06.101114 merlintechnologies.com.3375 >
h66-38-133-120.gtconnect.net.domain:  udp 48
13:56:06.104001 h66-38-133-120.gtconnect.net.1024 >
merlintechnologies.com.domain:  udp 44 (DF)
13:56:06.105434 merlintechnologies.com.domain >
h66-38-133-120.gtconnect.net.1024:  udp 181
13:56:06.106343 h66-38-133-120.gtconnect.net.1024 >
merlintechnologies.com.domain:  udp 46 (DF)
13:56:06.107284 merlintechnologies.com.domain >
h66-38-133-120.gtconnect.net.1024:  udp 161
13:56:06.108100 h66-38-133-120.gtconnect.net.1024 >
merlintechnologies.com.domain:  udp 44 (DF)
13:56:06.109056 merlintechnologies.com.domain >
h66-38-133-120.gtconnect.net.1024:  udp 178

--------------------------

The client (W2KPro nslookup) response is immediate:  

> chickens.com
Server:  h66-38-133-120.gtconnect.net
Address:  66.38.133.120

*** h66-38-133-120.gtconnect.net can't find chickens.com: No response
from server

--------------------------

Does anyone else have any ideas?  I really thank Aldo for his help, I
just do not want to monopolize his time by emailing him alone (which can
sometimes happen when someone is nice enough to help people out on
mailing lists).


> -----Original Message-----
> From: netfilter-admin@lists.samba.org 
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Aldo S. Lagana
> Sent: Monday, June 03, 2002 12:10 PM
> To: jjones@merlintechnologies.com; 'Iptables'
> Subject: RE: Help needed understanding what I am doing wrong.
> 
> 
> Answering backwards...
> 
> IP aliasing is fine with iptables - I have 35 IPs aliased to 
> one NIC and it works fine
> 
> You only need DNAT in PREROUTING and FORWARD rules to allow 
> incoming traffic to pass through your Gateway.  So I think 
> you have the DNAT rules right, you just need to add some 
> FORWARD rules - my FORWARD rules go like this: iptables -A 
> FORWARD -p tcp -d 192.168.101.54 --dport 80 -j ACCEPT
> 
> Where my -d address is obviously internal, so in your case it 
> will be 10.x.x.x
> 
> Aldo
> 


