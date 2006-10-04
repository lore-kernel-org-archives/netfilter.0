From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: STRING  module : Invalid argument
Date: Wed, 4 Oct 2006 11:45:17 +0200 (CEST)
Message-ID: <53842.193.173.147.3.1159955117.squirrel@webmail.sterenborg.info>
References: <45236AD9.4090300@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45236AD9.4090300@freemail.hu>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On Wed, October 4, 2006 10:03, G=EF=BF=BDsp=EF=BF=BDr Lajos wrote:
> Hi,
>
>
> Is there a bug in 2.6.18 kernel?
> I am using it with iptables v1.2.11 and the following command gives me
> error:
>
>
> fw1:~# iptables -A INPUT -j DROP -p tcp -m string --string "test"
> iptables: Invalid argument
>
>
> fw1:~# iptables -v -A INPUT -j DROP -p tcp -m string --string "test"
> DROP  tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  STRING match "tes=
t"
> iptables: Invalid argument
>
>
> fw1:~# uname -a
> Linux fw1 2.6.18.06.275.16 #1 SMP Mon Oct 2 16:29:40 CEST 2006 i686
> GNU/Linux
>
>
> fw1:~# iptables -V
> iptables v1.2.11
>
> Any comments?

Yeah.
- You probably don't have the string module installed and/or loaded.
- Kernel 2.6.18 is rather new (sep-2006) and iptables 1.2.11 is rather ol=
d
(june 2004). Upgrade to a new iptables version: 1.3.6 is just released.


Grts,
Rob



