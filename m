From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Help for IP Masquerading
Date: Wed, 14 May 2003 11:04:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E6D65A6EE5AAD6119DE800B0D03DA0C528966F@MS_LEU1>
References: <20030514075139.50609.qmail@web11504.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030514075139.50609.qmail@web11504.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Q-1 Should I configure SQUID  along with IP Masquerading in 
> my linux box or can I implement IP Masqueradig without SQUID?

You can use both simulateously, but one can do without the other.
You have to decide what you're going to do based on what you want to
accomplish.

> Q-2 I am using Linux 7.2 with kernel 2.4.7-10. can anyone 
> tell me is this kernel monolithic or  modularized?

It's modularized.
But I really think you'd better compile a vanilla 2.4.20 kernel with the
latest patch-o-matic and iptables.

> Q-3 If I am using IP Masquerading then I should assign the 
> Primary and Secondary DNS IP of my ISP ? or I can configure 
> my own dns server and assign those IP's to my script?

You can use the ISP's DNS server, but you can also install your own and
use the ISP's DNS as forwarder.
That way you can create your own DNS entries.

> Q-4 what would be command or procedures to automatically 
> update the IP of ppp0 whenever we connect to ISP in my 
> scripts or where ever need so?

Uhmm.. You can do like :

echo 0 > /proc/sys/net/ipv4/ip_forward
iptables -P DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED \
  -j ACCEPT
iptables -A FORWARD -i <if_lan> -o ppp0 -s 192.168.0.0/24 \
  -j ACCEPT
iptables -t nat -A POSTROUTING -o ppp0 -s 192.168.0.0/24 \
  -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward


If you really want to know the IP of the an interface :

ifconfig ppp0 | grep inet | sed 's/.*addr://' | sed 's/ .*$//'

> If anyone can help me and provide me the complete scripting 
> and procedures for implementing th IP  Masquerading then it 
> would be a great help for me and would be highly 
> appreciatable.Note: I am in deep big problem.kindly help me 
> out. thanks in advance

I think the above should give you a start.
Also have a look at :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Gr,
Rob


