From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Newbie question about nat
Date: Fri, 30 Apr 2004 19:37:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404301937.33366.Antony@Soft-Solutions.co.uk>
References: <004901c42edf$c73c77b0$a704a8c0@mpro4167>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004901c42edf$c73c77b0$a704a8c0@mpro4167>
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
Cc: netfilter@lists.netfilter.org

On Friday 30 April 2004 7:20 pm, Oriol Magran=E9 wrote:

>     Hello!
>     I'm trying to set up a firewall with two ethernets to be installed
> between the internet and a pool of servers.
>
>     I have some public ips available (a.b.c.e, a.b.c.f, a.b.c.g,...) so=
 now
> I want to map the external ip 'a.b.c.e' with the internal ip 192.168.1.=
100
>
> The only solution I've found is to define an ip alias in the firewall i=
tself
> so that eth0:1 will respond to the external ip a.b.c.e Thus when the ro=
uter
> of my ISP asks "who has ip a.b.c.e?", the firewall will answer "me" and=
 it
> will process the packet and deliver it to the internal server 1.
>
>     But this solution means defining an alias for every external ip I w=
ant
> to firewall. So if I have eight servers firewalled I will need eight ip
> alias in the firewall.

Correct.   This is not a problem.

However, it is recommended that you use the new (well, not that new, but =
more=20
recent) "ip" commands to add addresses to interfaces, rather than the=20
deprecated ethn:x alias method.

Try: "ip addr add a.b.c.e dev eth0" instead of the ifconfig eth0:1 comman=
d.

Regards,

Antony.

--=20
"It would appear we have reached the limits of what it is possible to ach=
ieve=20
with computer technology, although one should be careful with such=20
statements; they tend to sound pretty silly in five years."

 - John von Neumann (1949)

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


