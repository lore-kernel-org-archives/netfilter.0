From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Forwarding problem, :( port redirection!
Date: Mon, 24 Feb 2003 11:21:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019BD5@hslex01.hslbz.local>
References: <04a401c2dbdf$61d69d00$0b00000a@nocpc3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <04a401c2dbdf$61d69d00$0b00000a@nocpc3>
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
To: netfilter@lists.samba.org

> panic:/# iptables -t nat -A PREROUTING -i eth0 -p tcp -d
> 203.190.72.108 --dport 21 -j DNAT --to 10.0.0.11:21
> panic:/# iptables -A FORWARD -i eth0 -o eth1 -p tcp -d
> 203.190.72.108 --dport 21 -j ACCEPT
> panic:/# telnet 203.190.72.108 21
> Trying 203.190.72.108...
> telnet: Unable to connect to remote host: Connection refused
> panic:/# telnet 10.0.0.11 21
> Trying 10.0.0.11...
> Connected to 10.0.0.11.
> Escape character is '^]'.
> 220 Dynu FTP Server (Version 1.13)
> ^]
> telnet> q
> Connection closed.
> panic:/# telnet 203.190.72.108 21
> Trying 203.190.72.108...
> telnet: Unable to connect to remote host: Connection refused
> panic:/#

Did you load ip_conntrack_ftp and ip_nat_ftp ?
And do you use :
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT


Gr,
Rob


