From: =?iso-8859-1?Q?Paul_Blond=E9?= <jpb@entel.ca>
Subject: RE: iptables doesn't keep chain list after reboot
Date: Tue, 22 May 2007 08:46:04 -0700
Message-ID: <000a01c79c88$4e494b20$5a05a8c0@nisgaa.net>
References: <b6d73fa90705211212g3cd8464lf48e380a9256a79d@mail.gmail.com>
Reply-To: jpb@entel.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b6d73fa90705211212g3cd8464lf48e380a9256a79d@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

I recommend you read the site iptablesrocks.org very carefully while you =
are
making changes to your iptables firewall, as you can easily lock =
yourself
out of your own computer with netfilter. If you had, as I suggested =
before,
you would have found these instructions:

(assuming you made a file called primary_firewall in the home directory =
of
the root user, as the instructions on the site indicate)

copy the firewall file somewhere usefull:

cp /root/primary_firewall /etc/sysconfig/iptables

edit /etc/rc.local with your favourite text editor:

emacs /etc/rc.local (or vi, vim, xemacs, whatever)

add the following line:

/sbin/insmod ip_conntrack_ftp

I had to use a different method because the server I "inherited" from =
the
person who set it up was really messed up, but it should work on your
average Linux box.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Paul Blond=E9
Web Programmer
enTel Communications Inc
jpb@entel.ca
250.633.5151
866.633.2644
=20


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of TheNokia
> Sent: Monday, May 21, 2007 12:12 PM
> To: netfilter@lists.netfilter.org
> Subject: iptables doesn't keep chain list after reboot
>=20
>=20
> Ok, both of you tell me to put in /etc/rc.local but can you=20
> give me an example ?
>=20
> I don't want to do something wrong.
>=20


