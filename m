From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: IP Alias with iptables
Date: Mon, 19 Apr 2004 17:43:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082389424.1806.68.camel@anduril.intranet.cartel-securite.net>
References: <EMEKLOMJOPNJPAFKHEDJGECHCDAA.rhaces_chistes@yahoo.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EMEKLOMJOPNJPAFKHEDJGECHCDAA.rhaces_chistes@yahoo.com.mx>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Rodrigo Haces <rhaces_chistes@yahoo.com.mx>
Cc: netfilter@lists.netfilter.org

Le lun 19/04/2004 =E0 18:07, Rodrigo Haces a =E9crit :
> Ok, this is what i want, i have a Restaurant, and have an administrativ=
e
> network (192.168.1.0) and i am giving wireless access to my clients, bu=
t i
> cant let them get into my administrative network, so i set them 192.168=
.0.0.

Then aliases are not secure enough to deal with your settings. I mean
any wireless client that would change its IP manually to 192.160.1.0
will get administrative network priviliedges. You have to separate
thoses two LANs physically using a second network adapter or use a VLAN
aware switch connected by a trunk to eth0, configured to support 802.1q
tagging.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

