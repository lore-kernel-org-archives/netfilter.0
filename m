From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: TARPIT question (more info)
Date: Sun, 18 Apr 2004 19:36:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040418173652.6D67E474C@sterenborg.info>
References: <20040418160348.3296.qmail@web40714.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040418160348.3296.qmail@web40714.mail.yahoo.com>
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

> for tarpitports in 21 23 25 42 79 81 110 137 138 139
> 445 901; do
>   $path_iptables -t raw -A PREROUTING -i $ext_if -d $ext_ip 
> -p tcp --dport $tarpitports -j NOTRACK
>   $path_iptables -t raw -A PREROUTING -s $ext_ip -p tcp 
> --sport $tarpitports -j NOTRACK 
> 
>   $path_iptables -A INPUT -s 0.0.0.0/0 -d $ext_ip -i $ext_if 
> -p tcp -m tcp --dport $tarpitports -j TARPIT
>   $path_iptables -A INPUT -s 0.0.0.0/0 -d $ext_ip -i $ext_if 
> -p tcp -m tcp --dport $tarpitports -j LOG-INPUT # just in case done
> 
> Untracking the ports makes the situation safe for conntrack.
> 
> Now I also want to use the tarpit feature for ports > 1023.
> Who can help me here?

Maybe you can do something with the mport patch :
http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-mport

Ofcourse, you need to patch the kernel for that to work.

Gr,
Rob


