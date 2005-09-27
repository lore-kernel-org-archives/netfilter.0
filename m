From: Sp0oKeR <spooker@gmail.com>
Subject: Re: Plz i need help.... or i ll be fired :(
Date: Tue, 27 Sep 2005 12:03:04 -0300
Message-ID: <9255886c0509270803737a67f0@mail.gmail.com>
References: <20050927145748.68181.qmail@web54701.mail.yahoo.com>
Reply-To: Sp0oKeR <spooker@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050927145748.68181.qmail@web54701.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Alaios <alaios@yahoo.com>
Cc: netfilter@lists.netfilter.org

Try add

iptables -I POSTROUTING -t nat -o eth1 -j MASQUERADE

And make sure that second machine has first machine (IP) as gateway.

Att,


On 9/27/05, Alaios <alaios@yahoo.com> wrote:
>
> Hi plz take a look at the following example
>
> The laptop has 2 ethernet interfaces
> To eth1 comes traffic from src 143.233.222.253 <http://143.233.222.253>
> The eth0 has ip address 10.2.4.2 <http://10.2.4.2> and it is connected
> back to back with eth1 of other pc with ip address
> 10.2.4.1 <http://10.2.4.1>
> I want to forward the traffic with src 143.233.222.253<http://143.233.222=
.253>
> to the 10.2.4.1 <http://10.2.4.1> pc and if it works i will redo this
> for a second pc so as to l send the traffic to a third
> on.
> Can u help me plz?
>
> I have tried this one
> iptables -t nat -A PREROUTING -i eth1 -s
> 143.233.222.253 <http://143.233.222.253> -j DNAT --to-destination 10.2.4.=
1<http://10.2.4.1>
> i have also set the
> /proc/sys/net/ipv4/ip_forward to 1
> but still i cant see any trafiic to eth0 interface (ip
> 10.2.4.2 <http://10.2.4.2>)
>
>
> I have also tested this one
> iptables -t nat -A PREROUTING -p tcp -d 143.233.222.77<http://143.233.222=
.77>
> (laptop eth1 card) --dport 22453 (i have cheched dst
> port with tcpdump) 00 -j DNAT --to-destination
> 10.2.4.1 <http://10.2.4.1>
> this still doesnt work
> Every time i try to apply a new rule i use first
> the iptables -F
> iptables -t nat -F command
>
>
>
>
>
>
> __________________________________
> Yahoo! Mail - PC Magazine Editors' Choice 2005
> http://mail.yahoo.com
>
>


--
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Rodrigo Ribeiro Montoro
Desenvolvedor BRMAlinux
spooker@brc.com.br
RHCE/LPIC-I
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
