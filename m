From: Askar <askarali@gmail.com>
Subject: Re: DNS rules
Date: Sun, 1 May 2005 15:30:32 +0500
Message-ID: <a0f69e505050103303d959c4e@mail.gmail.com>
References: <915b3891601a.91601a915b38@vsnl.net>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <915b3891601a.91601a915b38@vsnl.net>
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

dnsmasq would be a bit off topic here. :)
you can download it from ....
http://thekelleys.org.uk/dnsmasq/doc.html (I will prefer the source)
After extracting the source, read "README" for howto install its
pretty straight forward.
./configure; make install (needed)

this will copy "dnsmasq" binary /usr/sbin , which needed to running
the dnsmasq daemon by type "dnsmasq" as root.

You can find the configuration file in /etc/dnsmasq.conf

You only have to change the line...

# Change this line if you want dns to get its upstream servers from
# somewhere other that /etc/resolv.conf
#resolv-file=3D

Note is not necessary coz if you don't set "resolv-fle=3D" , dnsmasq
will read /etc/resolv.conf for upstream dns servers (where you have
already specified your ISP dns IPs)
If you prefer to set "resolv-file=3D" tag then here are the setups

#vi /etc/mydnsserver (create a file where you have to hard code the
ips of your ISP dns servers

in the file type=20

nameserver xxx.xxx.xxx.xx (replace xxx with the ip)
nameserver xxx.xxx.xxxx.xx (specify as many dns servers you wants)

then in /etc/resolv.conf , delete all the entries and type ...

nameserver 127.0.0.1

Now start dnsmasq , and try to confirm that its working by "dig, host,
nslook etc)

You can also use dnsmasq as DHCP server ;)

Now you have to tell iptables to allow upd port 53 hmmmm

iptables -A INPUT -p udp -s 192.168.2.0/24 --dport 53 -j ACCEPT (for client=
)
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT (dnsmasq towards your ISP dn=
s)


Hope this will helps

Regards
Askar=20

On 5/1/05, varun_saa@vsnl.net <varun_saa@vsnl.net> wrote:
>=20
>=20
> ----- Original Message -----
> From: Askar <askarali@gmail.com>
> Date: Sunday, May 1, 2005 3:22 pm
> Subject: Re: DNS rules
>=20
> > Again it depends, how you setup your default policies. In case you are
> > using recommended "default DROP" then you have to tell iptables to
> > allow "udp 53" towards your ISP.
> >
> > iptables -A FORWARD -p udp --dport 53 -j ACCEPT
> >
> >
> > If you are running a small LAN then running a cache only dns on your
> > gateway would be beneficial, (that it will cache the lookups)
> >
> > dnsmasq is excellent cache only dns server and i'm sure you would get
> > is running within 10 minutes.
> > you can also use bind in cache only mode.
> >
> Thanks
>=20
> Can you elaborate on dnsmasq. Please.
>=20
> Varun
>=20
>=20


--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

