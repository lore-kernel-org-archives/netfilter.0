From: "David Busby" <busby@pnts.com>
Subject: Re: MSN and Yahoo Block through IPTABLES
Date: Wed, 25 Jun 2003 11:49:49 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004901c33b4a$963ee9b0$1100000a@busbydev>
References: <010a01c33b03$d78da1f0$5505a8c0@asimejaz>
Reply-To: "David Busby" <busby@pnts.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Asim Ejaz Butt <asim.butt@streaming-networks.com>, netfilter@lists.netfilter.org

Can you set policy to DROP then only allow what you need?

/B


----- Original Message ----- 
From: "Asim Ejaz Butt" <asim.butt@streaming-networks.com>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, June 25, 2003 03:23
Subject: MSN and Yahoo Block through IPTABLES


> Hello Gurus,
>
> I am trying to block MSN and Yahoo Instant Messengers with my LAN using
> IPTABLES. Following commands are used to block them but unsuccessful.
>
>  /sbin/iptables -A FORWARD -p tcp -s 192.168.5.85 --dport 1863 -j REJECT
>  /sbin/iptables -A FORWARD -p tcp -s 192.168.5.85 -d 64.4.0.0/18 -j REJECT
>
>  /sbin/iptables -A FORWARD -d cs.yahoo.com -j REJECT
>  /sbin/iptables -A FORWARD -d scsa.yahoo.com -j REJECT
>
> Anyone help in blocking them through IPTABLES.
>
> Asim Ejaz Butt
> asim.butt@streaming-networks.com
>


