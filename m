From: "Annette Meriste" <annette.meriste@cablecom.ch>
Subject: Antw: -m string --string cmd.exe
Date: Tue, 11 Jun 2002 18:18:09 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <sd063ee9.005@cablecom.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: iptables@atoka-software.com
Cc: netfilter@lists.samba.org

Hi Allen,

Download the newest version of iptables and make patch-o-matic.
This patch is experimental, i had to modify the source code of ipt_string.c=
 to get this feature.
After patching, activate the "string match support" in the kernel.

Cheers,
Annette

---------------------------------------------------------------------------=
----------------------------------------------------
Cablecom GmbH
Security Team
Zollstrasse 42
CH-8021 Z=FCrich
Voice: +41 1 277 99 21
Fax: +41 1 277 93 22
E-Mail: annette.meriste@cablecom.ch
>>> Allen Wayne Best <iptables@atoka-software.com> 11.06.02 18.12 Uhr >>>
hello:

i read in the linux journal the article "A NATural Progression" about a =
rule=20
which twinked my interest:

iptables -t filter -I FORWARD -m string \
   --string=3Droot.exe -j DROP

this set me to thinking, "ahhhh, a way to stop all those microcosm =
virii.=20
they have the commonality of the string 'cmd.exe.'" so off i go to build =
a=20
rule of similar bent, that is:

iptables -A  INPUT -i $EXTERNAL -p tcp --dport 80 \
    -m string --string=3Dcmd.exe -j DROP

when i try to use this rule, i get the following error:

iptables v1.1.1: Couldn't load match `string'

have i missed something, or do i need to recompile the kernel (please say =
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



