From: Axel Heinrici <heinrici76@gmx.de>
Subject: Re: ftp connection tracking
Date: Tue, 29 Jul 2003 15:58:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307291558.31734.heinrici76@gmx.de>
References: <200307291322.04698.heinrici76@gmx.de> <3F266E03.7050106@corp.lcom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F266E03.7050106@corp.lcom.net>
Content-Disposition: inline
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

Hi

On Tuesday 29 July 2003 14:52, Andrew J. Meader wrote:
> Hi,
>
> I just ran into this just yesterday. I was forgetting to load
> ip_conntrack_ftp in my iptables init script. For grins, here is a
> snip from my init script:

That is not the problem. The module is loaded. But the module doesn't 
track FTP-connections on non-standard ports. So FTP-connections to 
theses servers are not "allowed" by the "iptables .... -m --state 
RELATED,ESTABLISHED ...."-stuff.

>
> # Firewall Modules ~ assuming modularized kernel
>     /sbin/modprobe ip_tables
>     /sbin/modprobe iptable_nat
>     /sbin/modprobe ip_conntrack
>     /sbin/modprobe ip_conntrack_ftp
>
> YMMV - your modules may vary :)

greetings 
	Axel


