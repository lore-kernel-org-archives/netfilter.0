From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Newbie question about nat
Date: Mon, 3 May 2004 16:54:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405031654.14566.Antony@Soft-Solutions.co.uk>
References: <004901c42edf$c73c77b0$a704a8c0@mpro4167> <200404301937.33366.Antony@Soft-Solutions.co.uk> <001b01c43124$0c9d36f0$a704a8c0@mpro4167>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001b01c43124$0c9d36f0$a704a8c0@mpro4167>
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

On Monday 03 May 2004 4:33 pm, Oriol Magran=E9 wrote:

>     Thank you!
>     Now I'd like to set up an ftp server inside with private ip
> 192.168.1.111 and public ip a.b.c.k
>     So the nat rules will be:
>
>         iptables -t nat -A PREROUTING -d a.b.c.k -j DNAT --to 192.168.1=
.111
>         iptables -t nat -A POSTROUTING -s 192.168.1.111 -j SNAT --to
> a.b.c.k
>
>     However I don't know how to use the ip_conntrack_ftp and ip_nat_ftp
> modules when it comes to write the accept/drop rules.
>     If the server was a web server, I would use these rules:
>
>         iptables -A FORWARD -d 192.168.1.111 -p tcp --destination-port =
80
> -m state --state NEW,ESTABLISHED -j ACCEPT
>         iptables -A FORWARD -s 192.168.1.111 -p tcp --source-port 80 -m
> state --state ESTABLISHED -j ACCEPT

I don't normally write an ESTABLISHED rule for each protocol (specifying =
the=20
source port) - I would normally have just one rule on a firewall allowing=
=20
reply packets for all protocols:

iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

You don't need to bother about securing the machines it's supposed to all=
ow=20
connections from (-s) or the protocols it's supposed to allow (-p tcp,=20
--sport) because those have already been taken care of by the rule allowi=
ng=20
the connection to get set up in the first place.   Note the -I (insert) t=
o=20
make sure this rule appears at the top of the FORWARD chain for efficienc=
y.

>     But how should they be to allow active ftp access to 192.168.1.111
> using the ip_conntrack_ftp and ip_nat_ftp modules?

iptables -A FORWARD -d 192.168.1.111 -p tcp --dport 21 -j ACCEPT

along with the single system-wide rule I gave above.

Regards,

Antony.

--=20
"There has always been an underlying argument that we should open up our=20
source code more broadly. The fact is that we are learning from open sour=
ce=20
and we are opening our code more broadly through Shared Source.

Is there value to providing source code? The answer is unequivocally yes.=
"

 - Jason Matusow, head of Microsoft's Shared Source Program, in response =
to=20
recent leaks of Windows source code on the Internet.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


