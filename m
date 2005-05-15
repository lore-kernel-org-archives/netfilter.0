From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Combined Internal/External DNAT question
Date: Sun, 15 May 2005 09:54:14 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829073A1@pxtbenexd01.pxt.primeexalia.com>
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
To: Jonathan Wheeler <griffous@griffous.net>, netfilter@lists.netfilter.org

On that same topic, we a /25 subnet into the DMZ.  We end up with
something like section below.  You will notice that we also have the
double POSTROUTING entries as well as the output section.  In out case
we had to create a patch for the NETMAP code but that doesn't apply to
you though.



#############################################################
*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
#############################################################
# Prerouting Maps
#############################################################
[0:0] -A PREROUTING -d 33.44.55.128 -j RETURN
[0:0] -A PREROUTING -d 33.44.55.129 -j RETURN
[0:0] -A PREROUTING -d 33.44.55.128/26 -j NETMAP --to 10.0.0.128/26
[0:0] -A PREROUTING -d 33.44.55.192/27 -j NETMAP --to 10.0.0.192/27
[0:0] -A PREROUTING -d 33.44.55.224/28 -j NETMAP --to 10.0.0.224/28
[0:0] -A PREROUTING -d 33.44.55.248/30 -j NETMAP --to 10.0.0.248/30
#############################################################
# Postrouting Maps
#############################################################
[0:0] -A POSTROUTING -s 10.0.0.128 -j RETURN
[0:0] -A POSTROUTING -s 10.0.0.129 -j RETURN
[0:0] -A POSTROUTING -o eth0 -s 10.0.0.128/26 -j NETMAP --to
33.44.55.128/26
[0:0] -A POSTROUTING -o eth0 -s 10.0.0.192/27 -j NETMAP --to
33.44.55.192/27
[0:0] -A POSTROUTING -o eth0 -s 10.0.0.224/28 -j NETMAP --to
33.44.55.224/28
[0:0] -A POSTROUTING -o eth0 -s 10.0.0.248/30 -j NETMAP --to
33.44.55.248/30


# Without these, local lookups on the same network fail to
# find the server

[0:0] -A POSTROUTING -s 10.0.0.0/24 -d 10.0.0.128/26   -j NETMAP --to
33.44.55.128/26
[0:0] -A POSTROUTING -s 10.0.0.0/24 -d 10.0.0.192/27   -j NETMAP --to
33.44.55.192/27
[0:0] -A POSTROUTING -s 10.0.0.0/24 -d 10.0.0.224/28   -j NETMAP --to
33.44.55.224/28
[0:0] -A POSTROUTING -s 10.0.0.0/24 -d 10.0.0.248/30   -j NETMAP --to
33.44.55.248/30

[0:0] -A POSTROUTING -o eth0 -p ! esp -j SNAT --to-source 33.44.55.254

#############################################################
# Output Maps
# customized NETMAP to support OUTPUT
#############################################################
[0:0] -A OUTPUT -d 33.44.55.128 -j RETURN
[0:0] -A OUTPUT -d 33.44.55.129 -j RETURN
[0:0] -A OUTPUT -d 33.44.55.128/26 -j NETMAP --to 10.0.0.128/26
[0:0] -A OUTPUT -d 33.44.55.192/27 -j NETMAP --to 10.0.0.192/27
[0:0] -A OUTPUT -d 33.44.55.224/28 -j NETMAP --to 10.0.0.224/28
[0:0] -A OUTPUT -d 33.44.55.248/30 -j NETMAP --to 10.0.0.248/30

COMMIT


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Gary W. Smith
> Sent: Sunday, May 15, 2005 9:36 AM
> To: Jonathan Wheeler; netfilter@lists.netfilter.org
> Subject: RE: Combined Internal/External DNAT question
>=20
> -A POSTROUTING -s 10.0.0.130 -o eth0 -j SNAT --to-source 30.40.50.130
> -A POSTROUTING -s 10.0.0.0/255.255.255.0 -d 10.0.0.130 -j SNAT
> --to-source 30.40.50.130
>=20
>=20


