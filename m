From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: ECN target problems
Date: Wed, 5 Jun 2002 14:28:39 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206051421500.1937-100000@grignard>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter@lists.samba.org

Hi

I just installed 2.4.19-pre10 with all available pending patches from
iptables CVS. Besides the dscp, DSCP, newnat13 patches.

Rebooting to the new kernel, I cannot make the ECN target work...

root@grignard:~# /tmp/iptables/bin/iptables --version
iptables v1.2.7
root@grignard:~# uname -a
Linux grignard 2.4.19-pre10 #2 tir jun 4 18:36:56 CEST 2002 i686 unknown
root@grignard:~# /tmp/iptables/bin/iptables -t mangle -A OUTPUT -p tcp -j E=
CN --ecn-tcp-remove
iptables: Invalid argument
root@grignard:~# dmesg|tail -n 1
ECN: unsupported ECN operation 30

Am I doing something wrong? Is there anything that can be done about
this?

TIA
/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
[ Cancel Cancelled ]
              - Pine
----------------------------------[ moffe at amagerkollegiet dot dk ] --


