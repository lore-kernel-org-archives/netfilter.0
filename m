From: "AndreLSM" <a.news@terra.com.br>
Subject: Re: I think iptables is not alowing me to connect
Date: Fri, 20 Sep 2002 18:36:51 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005501c260ed$d5563eb0$2101a8c0@aerowillys>
References: <001f01c260ce$7e185ad0$2101a8c0@aerowillys> <20020920200354.RYHR292.mta01-svc.ntlworld.com@there>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Sorry I was not very clear,

Actualy I removed all iptables rules with:
iptables -F
iptables -X
iptables -Z

but adsl still hangs and does not connect.
Before  I started testing iptables it used to connect quickly.
My network is like this:
on eth0:  connection to another computer, ip 192.168.0.1 this is ok
on eth1: connection to the adsl modem. I know that this device can not be
initialized on the booting process and I thought that maybe iptables was
initializing it, but I removed all rules and stoped running the rc.firewall
file. This one has dynamic ip. I know that booth network adapters are
working fine, so it=B4s not hardware problem.


----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Friday, September 20, 2002 5:03 PM
Subject: Re: I think iptables is not alowing me to connect


> On Friday 20 September 2002 6:52 pm, AndreLSM wrote:
>
> > Hello all,
> >
> > I=B4m traying to set iptables working in my home LAN, but since then my
linux
> > box can=B4t connect ADSL as before. I have removed all rules in iptables
but
> > it won=B4t connect. Anyone has a clue whats happening?
>
> Yes.   Something's broken.
>
> Tell us what your network setup is, and tell us what your ruleset it, and
we
> might be able to tell you what's broken.
>
> Antony.
>
> --
>
> This email was created using 100% recycled electrons.
>
>
>



