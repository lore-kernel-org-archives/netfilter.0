From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Iptables Modules
Date: Mon, 11 Dec 2006 13:14:03 +0100 (CET)
Message-ID: <1538.193.173.119.247.1165839243.squirrel@webmail.sterenborg.info>
References: <20061211120210.4905E69469@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061211120210.4905E69469@smtp.sterenborg.info>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Mon, December 11, 2006 13:01, Ali Ozaltin wrote:
>
> Hello,
>
>
> When I use "lsmod" command i can see three enables module for iptables.=
 How
> can I enable other modules ? Can you pls help ?
>
> ip_tables  17669=EF=BF=BD 3 iptable_nat,iptable_mangle,iptable_filter

iptables -A ... -p <proto> ...

or

iptables -A ... -m <module> ...

(See: man iptables)

or

modprobe <iptables_module>

(See: man modprobe)

You can find the netfilter modules that you have installed in:

/lib/modules/`uname -r`/kernel/net/ipv4/netfilter


Grts,
Rob



