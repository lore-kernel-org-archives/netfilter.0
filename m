From: Harvey Muller <hlmuller@yahoo.com>
Subject: Fw: [RFC][PATCH][IPTABLES]: suppress the error of modprobe
Date: Sat, 24 Feb 2007 04:01:55 -0800 (PST)
Message-ID: <970870.93727.qm@web53615.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I didn't see this on netfilter-devel.   Forwarding to netfilter for Yasuyuk=
i's benefit.=0A=0A----- Forwarded Message ----=0AFrom: Harvey Muller <hlmul=
ler@yahoo.com>=0ATo: netfilter-devel@lists.netfilter.org=0ASent: Wednesday,=
 February 21, 2007 11:45:16 AM=0ASubject: [RFC][PATCH][IPTABLES]: suppress =
the error of modprobe=0A=0AYasuyuki,=0A=0AI was unable to patch using the t=
ext you provided in the post, as it kept complaining about malformed text.=
=0A=0AI did however make the corrections by hand using the iptables 1.3.7 r=
elease, and created a patch.  What I=0Anoticed is that all of the line numb=
ers match in your post match, except for those in ip6tables.c.  So you=0Ama=
y have made changes to a version different than that noted above.=0A=0AThe =
patch applies successfully, but the following error message is emitted duri=
ng make:=0A=0A=3D=3D=3D Error Message Starts =3D=3D=3D=0Aip6tables.c:1749: =
error: conflicting types for 'ip6tables_insmod'=0Ainclude/ip6tables.h:174: =
error: previous declaration of 'ip6tables_insmod' was here=0Amake: *** [ip6=
tables.o] Error 1=0Arm libiptc/libip6tc.o libiptc/libip4tc.o=0A=3D=3D=3D Er=
ror Message Ends =3D=3D=3D=0A=0AI hope this is helpful and best regards,=0A=
=0AHarvey=0A=0A=0A=0A=0A

