From: alexander.swann@synetics.fr
Subject: LOG flags 0
Date: Fri, 5 Jul 2002 19:37:31 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <OF66699DD4.943C2F61-ONC1256BED.0060744D-C1256BED.00610743@synetics.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org


Hello,

the rule :
$PATH -A FORWARD -d 192.168.252.0/22 -p all -s 10.1.1.0/24 -j LOG
--log-level DEBUG --log-prefix "FWlogDMZLAN : "

When I do a
# iptables -L -v -n

I get this result
610 29280 LOG        all  --  *      *       10.1.1.0/24
192.168.252.0/22   LOG flags 0 level 7 prefix `FWlogDMZLAN : '

My question is :
What meens the "flags 0" in "LOG flags 0 level 7 prefix `FWlogDMZLAN : =
' "

Thx

Alexander SWANN
Administrateur Syst=E8mes et R=E9seaux
SYNETICS Groupe Soft-Computing=



