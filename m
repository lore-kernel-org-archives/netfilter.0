From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Don't understand these errors with logdrop target
Date: Wed, 25 Aug 2004 10:49:32 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093423772.2246.3.camel@anduril.intranet.cartel-securite.net>
References: <412C4F8E.8010600@4Dllc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <412C4F8E.8010600@4Dllc.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Steve Comfort <steve@4Dllc.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Le mer 25/08/2004 =E0 10:36, Steve Comfort a =E9crit :
>         echo 2
>         $IPTABLES -P INPUT LOGDROP
[...]
> 2
> iptables: Bad policy name
> The question is : Why does using LOGDROP as a policy cause these errors=
?

Because only builtin targets can be used as policy, meaning ACCEPT and
DROP. If you want to use your LOGDROP as "policy", then you'll have to
keep it as last chain rule...


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

