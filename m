From: "Alberto Ferrer" <albertoferrer@gmail.com>
Subject: Re: How stop DoS and SYN attack..
Date: Tue, 6 Jun 2006 12:36:51 -0300
Message-ID: <e32f231c0606060836x7a4856bdx8ed1e2146723e46d@mail.gmail.com>
References: <02BB8A4AC86C564C89C7F14CF98CE0C49C72@knowledge.wizdom.nu>
	<4485974C.3060500@kernelproject.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4485974C.3060500@kernelproject.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

=BFSo its impossible stop a DDoS ? (SYN Flood in my case.)


2006/6/6, Jeho Park <jhpark-nf-user@kernelproject.org>:
> Sietse van Zanen wrote:
>
> >There's not really very much you can do about DDOS attacks with netfilte=
r alone. You can block the traffic ofcourse, or try to fiddle with --limit,=
 or tcp_syn_cookies.
> >
> >
> i think as a attacker try to send more and more sync packets, router
> will lose cpu time and system resource .. even if  tcp_syn_cookies
> function is active or not. the reason i think like this is that i heard
> tcp_syn_cookies
> can't stop router being slow..
>
> in this DDOS attaction problem, i suggest  as NIC driver module detects
> packet flooding, DOS attack and block or
> ignore the packet which is sent from the attacker. we can protect out
> network backlog safely and there will be no network soft irq ..
>
> a few week later, i will try to test my idea.
> i will use detection engine i made 3 year ago (
> http://sourceforge.net/projects/geto )
> as a result, i can't sure my idea is right. so i try to test that.
>
> >But usually the problem is that the amount of traffic just fills your en=
tire Internet connecection, which renders it useless. The only thing you ca=
n do in such a situation is ask yout ISP to block the attack upstream.
> >And often, ISPs are very unhappy about customers being DDOS-ed.
> >
> >-Sietse
> >
> >-----Original Message-----
> >From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-bounces@li=
sts.netfilter.org] On Behalf Of Alberto Ferrer
> >Sent: Saturday, June 03, 2006 10:33 PM
> >To: netfilter@lists.netfilter.org
> >Subject: How stop DoS and SYN attack..
> >
> >=BFany know a way to stop via Linux with iptables or related a SYN attac=
k ?
> >=BFwhere i can read something related to this?
> >
> >Thanks in advance.
> >
> >P.S: sorry for my bad english :D
> >--
> >Alberto Ferrer
> >
> >
> >
> >
> >
> >
>
>


--=20
bet0x

