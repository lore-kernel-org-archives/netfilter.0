From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: strange problem.
Date: Fri, 17 Jan 2003 20:45:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301172045.02921.Alistair@nerdnet.ca>
References: <D98357A0-2A49-11D7-A5F4-0003934AB744@mail.arc.nasa.gov>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D98357A0-2A49-11D7-A5F4-0003934AB744@mail.arc.nasa.gov>
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
To: "Michael P. Ryan" <mryan@mail.arc.nasa.gov>, netfilter@lists.netfilter.org



=09Why would it show as open in netstat? .. .there is no *service*
=09listening on that port.   The prerouting will simply mangle the
=09packet so that it gets routed to the destination ... You are not openi=
ng
=09a port on the firewall, you are telling the firewall to take packets t=
hat=20
=09show up at that port and ip and punt them around the corner ....

=09Alistair


On January 17, 2003 01:31 pm, Michael P. Ryan wrote:
> Hi,
>
>   On redhat 7.3 iptables 1.2.5, all needed modules appear to be loaded
> correctly.
>
> I have the box setup to nat and that works like a charm, but run into
> problems when I try to port forward to the internal network. Here is
> what I run, all pretty text book from what I can tell:
>
> $IPTABLES -P INPUT ACCEPT
> $IPTABLES -F INPUT
> $IPTABLES -P OUTPUT ACCEPT
> $IPTABLES -F OUTPUT
> $IPTABLES -P FORWARD DROP
> $IPTABLES -F FORWARD
> $IPTABLES -t nat -F
>
> # Portfw section
> $IPTABLES -A FORWARD -i eth0 -o eth1 -p tcp --dport 23 -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A PREROUTING -t  nat -p tcp -d my.external.ip --dport 23 -j
> DNAT --to 192.168.0.6:23
> #
>
>
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

