From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: OT RE: to snat or to dnat .. that is the question
Date: Tue, 1 Jun 2004 11:05:41 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567938F@alderaan.smgtec.com>
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
To: Alistair Tonner <Alistair@nerdnet.ca>, netfilter@lists.netfilter.org

I've got a few, but this is probably the worst.

file_systems=3D"`df | awk '{ print $1 }' | grep "/dev/" | sed
s/"\/dev\/"// \ =20
   | sed s/[0-9]//g | grep -v "md"` `cat /etc/raidtab 2> /dev/null |
grep device \
   | awk '{ print $2 }' | sed s/"\/dev\/"// | sed s/[0-9]//g`"



