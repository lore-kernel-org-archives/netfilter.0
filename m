From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Prerouting question
Date: Tue, 06 Apr 2004 20:21:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081275691.1737.28.camel@anduril.intranet.cartel-securite.net>
References: <000801c41c01$01e18b40$0464a8c0@stu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c41c01$01e18b40$0464a8c0@stu>
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
To: stu@gateway10.homeip.net
Cc: netfilter@lists.netfilter.org

Le mar 06/04/2004 =E0 20:00, Stuart Lamble a =E9crit :
> If prerouting is the first rule a packet touches when arriving at the
> firewall, why then do we not set the default to DROP here and allow
> through what we need.

Because filtering should be done in filter table.

Moreover, except for very specific case, I don't see the benefit in
having rules within PREROUTING that will allow packets, then having
other rules within INPUT/FORWARD to let them go. It seems a waste of
time to me as theses rules (PREROUTING vs. INPUT/FORWARD) are
necessarily redundant.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

