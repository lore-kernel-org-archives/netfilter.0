From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Forwarding HTTP question
Date: 05 Jul 2003 01:22:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1057382564.2822.22.camel@alpha.newkirk.us>
References: <004f01c34231$f1d429f0$6800817d@TESTE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004f01c34231$f1d429f0$6800817d@TESTE>
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
To: Guilherme Viebig <guilherme@plannercorretora.com.br>
Cc: *netfilter <netfilter@lists.netfilter.org>

On Fri, 2003-07-04 at 09:41, Guilherme Viebig wrote:
> My Firewall has two interfaces
> 
> eth0 200.123.234.111
> eth1 192.168.0.1
> 
> I have an internal webserver on 192.168.0.33
> 
> How can I setup iptables to forward incoming traffic by eth0 to port 80 go
> to 192.168.0.33:80 ?

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to 192.168.0.33

j



