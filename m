From: "Tarek W." <ticallion@terra.net.lb>
Subject: Re: monitor masq. packets
Date: Sun, 08 Dec 2002 23:07:11 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039396033.12535.10.camel@carve.localdomain>
References: <001a01c29d6e$2dedd580$7900a8c0@ibmfhyhjarw99d>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <001a01c29d6e$2dedd580$7900a8c0@ibmfhyhjarw99d>
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


Netfilter no longer stores nat'ed connections in the /proc/ on their own
which is where netstat looks for the information (man netstat). All
connections are in /proc/net/ip_conntrack. You can consult that file to
spot connections with internal ips or use a utility such as iptstate
(freshmeat.net).

On Fri, 2002-12-06 at 19:26, zmooth wrote:
> 
> Hi, ive noticed that : netstat -M does not work anymore. Is it just me ? i
> get :
> 
>     netstat: no support for 'ip_masquerade' on this system, while iptables
> is loaded and masquerading already. Please help
> 
> 
> 




