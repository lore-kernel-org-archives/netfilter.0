From: Allen Wayne Best <iptables@atoka-software.com>
Subject: -m string --string cmd.exe
Date: Tue, 11 Jun 2002 09:11:00 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020611161436.F3A0D4891@lists.samba.org>
Reply-To: iptables@atoka-software.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

hello:

i read in the linux journal the article "A NATural Progression" about a r=
ule=20
which twinked my interest:

iptables -t filter -I FORWARD -m string \
   --string=3Droot.exe -j DROP

this set me to thinking, "ahhhh, a way to stop all those microcosm virii.=
=20
they have the commonality of the string 'cmd.exe.'" so off i go to build =
a=20
rule of similar bent, that is:

iptables -A  INPUT -i $EXTERNAL -p tcp --dport 80 \
    -m string --string=3Dcmd.exe -j DROP

when i try to use this rule, i get the following error:

iptables v1.1.1: Couldn't load match `string'

have i missed something, or do i need to recompile the kernel (please say=
 it=20
ain't so.....) fyi, i am using rh 7.0 and rh 7.2 on the servers.

--=20
regards,
allen wayne best, esq
"your friendly neighborhood rambler owner"
"my rambler will go from 0 to 105"
Current date: 20:54:8::161:2002

"Gort, klaatu nikto barada."
-- The Day the Earth Stood Still

