From: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Subject: connlimit problem
Date: Fri, 09 Sep 2011 10:02:57 +0200
Message-ID: <4E69C831.4050004@univ-nantes.fr>
Reply-To: jean-philippe.menil@univ-nantes.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I try to limit the connection per ip with connlimit in addition to the=20
socket match, with the following rule:
$IPTABLES -t mangle -A PREROUTING -s $LAN -p tcp --syn --dport http -m=20
socket -m connlimit --connlimit-above 0 -j DIVERT

But as you can see, theses rules  never match:

     0     0 DIVERT     tcp  --  *      *       192.168.100.0/24    =20
0.0.0.0/0            tcp dpt:80flags: 0x17/0x02 socket #conn src/32 > 1
     9  3030 DIVERT     tcp  --  *      *       192.168.100.0/24    =20
0.0.0.0/0            tcp dpt:80 socket
     5   216 TPROXY     tcp  --  *      *       192.168.100.0/24    =20
0.0.0.0/0            tcp dpt:80 TPROXY redirect 0.0.0.0:50080 mark 0x1/=
0x1
     0     0 DIVERT     tcp  --  *      *       192.168.100.0/24    =20
0.0.0.0/0            tcp dpt:3128flags: 0x17/0x02 socket #conn src/32 >=
 1
     6  2491 DIVERT     tcp  --  *      *       192.168.100.0/24    =20
0.0.0.0/0            tcp dpt:3128 socket
    19   800 TPROXY     tcp  --  *      *       192.168.100.0/24    =20
0.0.0.0/0            tcp dpt:3128 TPROXY redirect 0.0.0.0:50080 mark 0x=
1/0x1

Is this an expected behaviour, or a problem in my rules?

Regards

--=20
Jean-Philippe Menil - P=F4le r=E9seau Service IRTS
DSI Universit=E9 de Nantes
jean-philippe.menil@univ-nantes.fr
Tel : 02.53.48.49.27 - Fax : 02.53.48.49.09

