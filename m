From: Devaraj Das <ddas@india.hp.com>
Subject: Re: kernel 2.6 IPsec and netfilter
Date: Mon, 29 Mar 2004 20:43:25 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40683D15.B6220B5F@india.hp.com>
References: <4068040C.AA93F507@india.hp.com> <4068179D.1030509@smcc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="macroman"
To: Thomas Lussnig <lussnig@smcc.net>, lpowers@mis.net
Cc: netfilter@lists.netfilter.org

Thanks for your responses Thomas & Lane. I forgot to mention that I am us=
ing
racoon as the IKE daemon. If I enable ipsec tunnelling between two linux-=
2.6
machines, things work fine. I am able to restrict accesses to ports, etc.

I also have windows (2K) machines that can be connected as a client to th=
e
linux-2.6 machine. The problem that I am facing now is that the windows
machine's native ipsec implementation does not work if the "tunnel mode" =
is
enabled. So now I am looking for a solution that does not require enablin=
g
tunnelling.

Thanks for your help.

Devaraj.

Thomas Lussnig wrote:

> Devaraj Das wrote:
>
> >Hi,
> >I wanted to know whether there is a working solution for the issue tha=
t
> >was discussed sometime back:
> >http://www.spinics.net/lists/netfilter/msg22099.html
> >In short is there any solution to enable blocking selective ports in a
> >machine running Linux 2.6.0 + in-kernel ipsec.
> >I would be very helpful if I can get a working solution or some
> >information on a possible solution.
> >Thanks,
> >Devaraj.
> >
> >
> Hi,
> if you look at ipsec from Linux-2.6.0 you would have noticed that you d=
efine
> SRC-IP/SRC-PORT -- DST-IP/DST-PORT this mean you question imply the
> following setup:
>
> 1. You allow any port combination to go via the ipsec tunnel
> 2. You have ports that should not go via the ipsec tunnel wich you allo=
w
> via ipsec
> 3. Now this ports should be filtered on iptables layer
> - possible at prerouting/mangle
> + define the correkt ipsec config
>
> Gru=DF Thomas Lu=DFnig


