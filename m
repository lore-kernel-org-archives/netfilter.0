From: =?ISO-8859-1?Q?Pierre-Etienne_M=E9let?=
 <melet_pierre_etienne@yahoo.fr>
Subject: Problem with "owner"
Date: Mon, 22 Dec 2003 22:24:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FE76121.7020605@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

   before compiling my own iptables (I'm working with iptables 1.2.7 rpm=20
given with Mandrake 9.1), i'd like to be sure i'm not making a mistake:

My purpose is to allow thunderbird only to access internet through pop3:

$IPTABLES -A INPUT -i $EXTERNAL_IF -p tcp --sport pop3 \
        -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A OUTPUT -o $EXTERNAL_IF -p tcp --dport pop3 \
        -m owner --cmd-owner 'thunderbird-bin' \
        -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT


Unfortunately, "thunderbird-bin" is unable to pass the firewall.

What am i doing wrong ?

Best regards.

--=20
M=E9let Pierre-Etienne

Pierre-Etienne.Melet@ingenieurs-supelec.org

dom: 04 93 65 39 67
mob: 06 03 67 95 44


