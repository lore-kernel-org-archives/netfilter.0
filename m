From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: smtp/pop and NAT only
Date: Wed, 18 May 2005 12:24:56 +0200
Message-ID: <20050518102513.682708EDCEB@smtp.sterenborg.info>
References: <18e051d18e05d2.18e05d218e051d@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <18e051d18e05d2.18e05d218e051d@vsnl.net>
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

> Hello,
>      My server is on FC3 (fedora3)
> eth0 is WAN ---> DSL router ----> ISP
> eth1 is LAN

Not sure I understand the ASCII art : is your server the DSL router ?

> I would like to that 2 client 192.168.0.253 and 192.168.0.248 
> are connected to " fedora3 server "
> via NAT.

So that they can do "anything" ?

> And all other clients connected to "fedora3 server"
> are able to only send / recieve mail.
> 
> Howto do that

Something like :

$IPT -P FORWARD DROP

$IPT -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPT -A FORWARD -i eth1 -o eth0 -s 192.168.0.248 -j ACCEPT
$IPT -A FORWARD -i eth1 -o eth0 -s 192.168.0.253 -j ACCEPT
$IPT -A FORWARD -i eth1 -o eth0 -p tcp --dport 25 -j ACCEPT
$IPT -A FORWARD -i eth1 -o eth0 -p tcp --dport 110 -j ACCEPT

$IPT -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -j SNAT \
  --to-source <inet_ip>

Maybe Oscars IPTables tutorial is something useful :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Gr,
Rob


