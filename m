From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: radius
Date: Tue, 17 Jun 2003 08:40:44 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DD5@alderaan.smgtec.com>
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
To: Esteban <esteban@alstec.fr>, netfilter@lists.netfilter.org

Umm... correct me if I am wrong here, but radius is pretty useless
unless there is an internet service responding and using those requests.
Netfilter is not that high level protocol.

PPP on the other hand has a handshake, and DOES support radius in later
releases.=20

Could you elaborate on 'implements'? Maybe I am totally wrong in what
you are asking (probably...).

-----Original Message-----
From: Esteban [mailto:esteban@alstec.fr]=20
Sent: Tuesday, June 17, 2003 9:10 AM
To: netfilter@lists.netfilter.org
Subject: radius

Hello,

is there a patch for netfilter which implements radius authentication ?

Thx.

--=20
Stephane DESMET
Alstec Informatique
17, rue du Colisee
75008 Paris


