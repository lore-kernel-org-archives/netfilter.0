From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Iptables Email Alerting
Date: Mon, 15 Mar 2004 10:20:57 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56791FB@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Real Cucumber <monkcucumber@yahoo.com>, netfilter@lists.netfilter.org

Netfilter is kernel space and there isn't email support in the kernel.
My advice is either using crontab or write your own daemon to probe
every few seconds.



Real Cucumber wrote:
> Does anyone know if it is possible to have IPtables
> send email alerts
> based on certain traffic?
>=20
> I'm looking for something similair to the -j LOG
> option, perhaps a -j MAIL ?
>=20
> I realize that I could setup a manual cronjob to scan
> the logfiles via grep and search for certain
> activities, but it would obviously be much better to
> have alerts sent in realtime.
>=20
> Any ideas?
>=20
>=20
>=20
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail - More reliable, more storage, less spam
> http://mail.yahoo.com=20

