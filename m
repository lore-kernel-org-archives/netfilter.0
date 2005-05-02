From: "John G. Norman" <john.g.norman@gmail.com>
Subject: Re: On vanilla Fedora 3, can't do a transparent proxy (-j REDIRECT)
Date: Mon, 2 May 2005 17:18:21 -0400
Message-ID: <df31c404050502141865ca509c@mail.gmail.com>
References: <df31c4040505021142197fdcdc@mail.gmail.com>
	<df31c40405050213556ddc65b2@mail.gmail.com>
	<20050502210104.GB12530@bender.817west.com>
	<200505021812.37561.ramoni@databras.com.br>
Reply-To: john@7fff.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505021812.37561.ramoni@databras.com.br>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Ramoni <ramoni@databras.com.br>
Cc: netfilter@lists.netfilter.org

Ramoni,

Thank you (and Jason) very, very much. I didn't know that the
prerouting chain for the nat table is not valid for locally generated
packets.

Just to get this into the thread: Why is the output chain the right
place for locally generated packets?

I.e., if I did want a request to port 80 from the local machine to get
redirected to port 8080, what would I do?

John

On 5/2/05, Ramoni <ramoni@databras.com.br> wrote:
> And the prerouting chain at the nat table is not valid for locally genera=
ted
> packets.
> The output chain is for that.
>=20
> But in all cases, I think Jason is right.
>=20
> On Monday 02 May 2005 18:01, Jason Opperisano wrote:
> > On Mon, May 02, 2005 at 04:55:00PM -0400, John G. Norman wrote:
> > > Here's a transcript:
> > >
> > > [root@preview ~]# /sbin/iptables -t filter -F
> > > [root@preview ~]# /sbin/iptables -t mangle -F
> > > [root@preview ~]# /sbin/iptables -t nat -F
> > > [root@preview ~]# cat /proc/sys/net/ipv4/ip_forward
> > > 1
> > > [root@preview ~]# /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp
> > > --dport 80 80 -j REDIRECT --to-port 80
> > > [root@preview ~]# wget http://localhost >/dev/null
> >
> > your problem is your testing methodology.  do not try and test
> > transparent proxying from the proxy machine itself--it's not a valid
> > test of what you really want; which is transparent proxying of client
> > requests made from machines behind the proxy.
> >
> > start testing from behind the firewall/proxy and see if you still have
> > problems.
> >
> > -j
> >
> > --
> > "Stewie: It rubs the lotion on its skin or else it gets the hose again.=
"
> >         --Family Guy
>=20
> --
> Andr=E9 "Ramoni" (Cabelo)
> Redes / Linux
> Nada de Windows
> Databras Informatica
> Tel: (21) 2518-2363
> Fax: (21) 2263-6830
>=20
>

