From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ROUTE + SNAT Problem
Date: Wed, 04 Feb 2004 18:01:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075914105.827.66.camel@elendil.intranet.cartel-securite.net>
References: <12462133.1075911219098.JavaMail.www@wwinf4001>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <12462133.1075911219098.JavaMail.www@wwinf4001>
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
To: tonton19@voila.fr
Cc: netfilter@lists.netfilter.org

Le mer 04/02/2004 =E0 17:13, tonton19 a =E9crit :
> everything works, all is ok, each packet which matches with the first
> rule, matches with the second too. But, when I declare the following
> rule :
> # iptables -t mangle -A POSTROUTING -d 173.20.0.210 -p tcp --dport 80
> -j ROUTE --oif eth0
> the second rule (with SNAT target) no longer works !!! I can see with
> iptables -t nat --list --verbose that no packet match with the second
> rule. In the other hand the third rules (with ROUTE target) works
> well. So, please help me ! Wat's the problem ? Is there an
> incompatibility beetween ROUTE and SNAT targets ? or my rules are not
> good ?

As far as I can remember, use of ROUTE target stops NF_IP_POST_ROUTING
crossing to send packet directly. For mangle table is prior to nat one,
then SNAT rules are not evaluated.
You should have a look to very last patch-o-matic (maybe still CVS)
where ROUTE target include a special option for continue hook traversal.
See :

http://cvs.netfilter.org/netfilter/patch-o-matic/extra/ROUTE.patch

	"Updated version with new option to continue rule-traversal
	 (Cedric de Launois)"

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

