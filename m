From: Askar <askarali@gmail.com>
Subject: Re: DNS rules
Date: Sun, 1 May 2005 15:33:52 +0500
Message-ID: <a0f69e505050103332635a25b@mail.gmail.com>
References: <915b3891601a.91601a915b38@vsnl.net>
	<a0f69e505050103303d959c4e@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e505050103303d959c4e@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

oops too quick to hit te Send buttong :)

if you going to set=20
#resolv-file=3D
in /etc/dnsmasq then don't forget to repace it something

resolv-file=3D/etc/mydnsservers (the file that holding the IPs of your
ISP dns servers)

regards


On 5/1/05, Askar <askarali@gmail.com> wrote:
> dnsmasq would be a bit off topic here. :)
> you can download it from ....
> http://thekelleys.org.uk/dnsmasq/doc.html (I will prefer the source)
> After extracting the source, read "README" for howto install its
> pretty straight forward.
> ./configure; make install (needed)
>=20
> this will copy "dnsmasq" binary /usr/sbin , which needed to running
> the dnsmasq daemon by type "dnsmasq" as root.
>=20
> You can find the configuration file in /etc/dnsmasq.conf
>=20
> You only have to change the line...
>=20
> # Change this line if you want dns to get its upstream servers from
> # somewhere other that /etc/resolv.conf
> #resolv-file=3D
>=20
> Note is not necessary coz if you don't set "resolv-fle=3D" , dnsmasq
> will read /etc/resolv.conf for upstream dns servers (where you have
> already specified your ISP dns IPs)
> If you prefer to set "resolv-file=3D" tag then here are the setups
>=20
> #vi /etc/mydnsserver (create a file where you have to hard code the
> ips of your ISP dns servers
>=20
> in the file type
>=20
> nameserver xxx.xxx.xxx.xx (replace xxx with the ip)
> nameserver xxx.xxx.xxxx.xx (specify as many dns servers you wants)
>=20
> then in /etc/resolv.conf , delete all the entries and type ...
>=20
> nameserver 127.0.0.1
>=20
> Now start dnsmasq , and try to confirm that its working by "dig, host,
> nslook etc)
>=20
> You can also use dnsmasq as DHCP server ;)
>=20
> Now you have to tell iptables to allow upd port 53 hmmmm
>=20
> iptables -A INPUT -p udp -s 192.168.2.0/24 --dport 53 -j ACCEPT (for clie=
nt)
> iptables -A OUTPUT -p udp --dport 53 -j ACCEPT (dnsmasq towards your ISP =
dns)
>=20
> Hope this will helps
>=20
> Regards
> Askar
>=20
> On 5/1/05, varun_saa@vsnl.net <varun_saa@vsnl.net> wrote:
> >
> >
> > ----- Original Message -----
> > From: Askar <askarali@gmail.com>
> > Date: Sunday, May 1, 2005 3:22 pm
> > Subject: Re: DNS rules
> >
> > > Again it depends, how you setup your default policies. In case you ar=
e
> > > using recommended "default DROP" then you have to tell iptables to
> > > allow "udp 53" towards your ISP.
> > >
> > > iptables -A FORWARD -p udp --dport 53 -j ACCEPT
> > >
> > >
> > > If you are running a small LAN then running a cache only dns on your
> > > gateway would be beneficial, (that it will cache the lookups)
> > >
> > > dnsmasq is excellent cache only dns server and i'm sure you would get
> > > is running within 10 minutes.
> > > you can also use bind in cache only mode.
> > >
> > Thanks
> >
> > Can you elaborate on dnsmasq. Please.
> >
> > Varun
> >
> >
>=20
> --
> I love deadlines. I like the whooshing sound they make as they fly by.
> Douglas Adams
>=20


--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

