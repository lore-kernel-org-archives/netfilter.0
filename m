From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: DNAT Help
Date: Mon, 21 Oct 2002 08:46:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c278cd$a159c940$0401000a@robbysan.org>
References: <004f01c27890$69ce59b0$8b1c000a@raven>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004f01c27890$69ce59b0$8b1c000a@raven>
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

> I'm trying to telnet to 1.2.3.4 port 25
>
> Where I'm DNATing 1.2.3.4 to 1.2.3.5
>
> telnet is still trying to connect to 1.2.3.4 but it never get any
connections.
>
> Here is my nat table.
>
>
> mailserv:/etc# /sbin/iptables -L -t nat
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> DNAT       all  --  anywhere             1.2.3.4    to:1.2.3.5
>
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> DNAT       all  --  anywhere            1.2.3.4     to:1.2.3.5

You should not use the OUTPUT chain in the nat table ; just the
PREROUTING chain will do.

Do you also have a FORWARD rule in the filter table ? I think you need
something like :
iptables -A FORWARD -i <if_in> -d 1.2.3.5 -p tcp --dport 25 -j ACCEPT

Is your prerouting rule something like :
iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 25 -j
DNAT --to-destination 1.2.3.5:25

Do you have :
echo 1 > /proc/sys/net/ipv4/ip_forward


Rob


