From: =?iso-8859-1?Q?Oriol_Magran=E9?= <omagrane@mediapro.es>
Subject: Re: Newbie question about nat
Date: Mon, 3 May 2004 17:33:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001b01c43124$0c9d36f0$a704a8c0@mpro4167>
References: <004901c42edf$c73c77b0$a704a8c0@mpro4167> <200404301937.33366.Antony@Soft-Solutions.co.uk>
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


    Thank you!
    Now I'd like to set up an ftp server inside with private ip
192.168.1.111 and public ip a.b.c.k
    So the nat rules will be:

        iptables -t nat -A PREROUTING -d a.b.c.k -j DNAT --to 192.168.1.111
        iptables -t nat -A POSTROUTING -s 192.168.1.111 -j SNAT --to a.b.c.k

    However I don't know how to use the ip_conntrack_ftp and ip_nat_ftp
modules when it comes to write the accept/drop rules.
    If the server was a web server, I would use these rules:

        iptables -A FORWARD -d 192.168.1.111 -p tcp --destination-port 80 -m
state --state NEW,ESTABLISHED -j ACCEPT
        iptables -A FORWARD -s 192.168.1.111 -p tcp --source-port 80 -m
state --state ESTABLISHED -j ACCEPT

    But how should they be to allow active ftp access to 192.168.1.111 using
the ip_conntrack_ftp and ip_nat_ftp modules?

    Thank you very much in advance!!

    Oriol



----- Original Message -----=20
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Cc: <netfilter@lists.netfilter.org>
Sent: Friday, April 30, 2004 8:37 PM
Subject: Re: Newbie question about nat


On Friday 30 April 2004 7:20 pm, Oriol Magran=E9 wrote:

>     Hello!
>     I'm trying to set up a firewall with two ethernets to be installed
> between the internet and a pool of servers.
>
>     I have some public ips available (a.b.c.e, a.b.c.f, a.b.c.g,...) so
now
> I want to map the external ip 'a.b.c.e' with the internal ip 192.168.1.100
>
> The only solution I've found is to define an ip alias in the firewall
itself
> so that eth0:1 will respond to the external ip a.b.c.e Thus when the
router
> of my ISP asks "who has ip a.b.c.e?", the firewall will answer "me" and it
> will process the packet and deliver it to the internal server 1.
>
>     But this solution means defining an alias for every external ip I want
> to firewall. So if I have eight servers firewalled I will need eight ip
> alias in the firewall.

Correct.   This is not a problem.

However, it is recommended that you use the new (well, not that new, but
more
recent) "ip" commands to add addresses to interfaces, rather than the
deprecated ethn:x alias method.

Try: "ip addr add a.b.c.e dev eth0" instead of the ifconfig eth0:1 command.

Regards,

Antony.

--=20
"It would appear we have reached the limits of what it is possible to
achieve
with computer technology, although one should be careful with such
statements; they tend to sound pretty silly in five years."

 - John von Neumann (1949)

                                                     Please reply to the
list;
                                                           please don't CC
me.



