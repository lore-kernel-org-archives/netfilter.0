From: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Subject: Ipset counters question
Date: Tue, 29 Mar 2011 12:31:45 +0200
Message-ID: <4D91B511.3040005@univ-nantes.fr>
Reply-To: jean-philippe.menil@univ-nantes.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

basiclly, i'm working on a captive portal, who add some rules in=20
PRE/POSTROUTING mangle table when a user is fully authenticated.
$IPTABLES -t mangle -N OUT-AUTH
$IPTABLES -t mangle -A PREROUTING -j OUT-AUTH
$IPTABLES -t mangle -N IN-AUTH
$IPTABLES -t mangle -A POSTROUTING -j IN-AUTH

and the following rules are append when an user is authenticate:
$IPTABLES -t mangle -A OUT-AUTH -s $IP -m mac --mac-source $IP -j MARK=20
--set-mark 10
$IPTABLES -t mangle -A IN-AUTH -d $IP -j ACCEPT

I dicovered ipset, and begin to play with it.
If my understand of is correct, i can add:

ipset -N TEST macipmap --network 192.168.100.0/24
$IPTABLES -t mangle -A IN-AUTH -m set --set TEST src,dst -j ACCEPT
$IPTABLES -t mangle -A OUT-AUTH -m set --set TEST src,dst -j MARK=20
--set-mark 10

And when an user authenticate, add the following ipset:
ipset -A TEST 192.168.100.2,xx:xx:xx:xx:xx:xx

However, for some accountig reason, i used to check the iptables=20
counters (-nvxL) by ip.
If i replace, my iptables rules by an ipset type, i cannot check=20
counters anymore.

If i decide to use ipset, is there a way to check counters by ip, or=20
something like that?

Regards.

--=20
Jean-Philippe Menil - P=F4le r=E9seau Service IRTS
DSI Universit=E9 de Nantes
jean-philippe.menil@univ-nantes.fr
Tel : 02.53.48.49.27 - Fax : 02.53.48.49.09

