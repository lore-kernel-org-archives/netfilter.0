From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: netfilter and iproute2
Date: Thu, 19 Aug 2004 10:34:21 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E358@alderaan.smgtec.com>
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
To: Gavin Hamill <gdh@acentral.co.uk>, netfilter@lists.netfilter.org


> Any ideas? :)

From your description, you didn't convey what networks you have. One
question would be is 213.2.4.37 bound to the firewall itself or is it a
machine behind it?

If it's a firewall IP, prerouting won't assign locally sourced packets
in PREROUTING, only in OUTPUT. Even then there's no guarantee that
OUTPUT has been assigned an IP. The  'src <ip>' clause in iproute2
assigns the default IP if the program itself hasn't.

If it's a machine's behind your firewall (on eth1), it seems kind of
strange that it doesn't work. When you say it doesn't work, do you mean
that no traffic traverses the new interfacen that some traffic goes to
each, or that all of the traffic goes out the original interface? Once
again, this doesn't really make sence to me if why this wouldn't work.


