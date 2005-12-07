From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: stop accepting new connections on port 80
Date: Wed, 7 Dec 2005 16:58:00 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B3C4@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Spam User
> Sent: Wednesday, December 07, 2005 3:39 PM
> To: netfilter@lists.netfilter.org
> Subject: stop accepting new connections on port 80
>=20
> Hi,
>=20
> I've been trying to figure out how to get iptables to stop=20
> accepting new connections on port 80 while letting the=20
> existing connections finish up what they're doing.
>=20
> I thought it would be as easy as removing the rule that=20
> allows new connections and leaving the rule that allowed=20
> related and established connections, but when I remove the=20
> rule that allows new connections, all connections stop working.

[snip]

I don't know exactly how you're determining the above: is it a long
download that gets killed? HTTP opens at least (and usually only) one
connection per page so the problem may be that the connection is already
closed even though the page is still being viewed. Unless you are
downloading something it's not likely your connection will last much
longer than four or five seconds on a heavily graphical page with
broadband.=20

Your rules look ok at first glance so I would recommend some time with
Ethereal and a long download from the web server. Download a big file
once with your default rules and see what happens. Then delete the file
and download it again, this time running your kill-new-connections
script and see if the file transfer gets knocked immediately.
=20
> Thanks,
>=20
> Mike

Derick Anderson

