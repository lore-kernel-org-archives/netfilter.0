From: xchris <lyra@fastwebnet.it>
Subject: Re: Can iptables manager source mac address?
Date: Wed, 16 Apr 2003 12:51:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304161251.44612.lyra@fastwebnet.it>
References: <1050747660.10928.6.camel@ntc9.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1050747660.10928.6.camel@ntc9.local>
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
To: NetSnake <netsnake@963.net>, netfilter@lists.netfilter.org

On Saturday 19 April 2003 12:21, NetSnake wrote:
>   I use iptables to nat to internet, but I found some user use a proxy
> on intranet, like, 192.168.0.5 can access to internet, 192.168.0.10 can
> not access to internet, now 10 access a proxy on 192.168.0.5, then he
> can access now, I thought in package from 192.168.0.5 must contant some
> information about proxy, like source mac address, this can help me to
> identified users, can iptables do this?

the source address for machine 192.168.0.10 is masqueraded!!
This because in effect it's 192.168.0.5 to access internet.
I guess there is no solution.

bye

