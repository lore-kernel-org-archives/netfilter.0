From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 14:51:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072187466.812.108.camel@elendil.intranet.cartel-securite.net>
References: <20031223133703.24761.qmail@web60409.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031223133703.24761.qmail@web60409.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>
Cc: Chris Brenton <cbrenton@chrisbrenton.org>, netfilter@lists.netfilter.org

Le mar 23/12/2003 =E0 14:37, ads nat a =E9crit :
> Get following error :
> [root@allweb root]# /etc/init.d/iptables restart
> Flushing all current rules and user defined chains:  =20
>     [  OK  ]
> Clearing all current rules and user defined chains:  =20
>     [  OK  ]
> Applying iptables firewall rules: iptables-restore
> v1.2.6a: Unknown arg `--tcp-flags'
> Try `iptables-restore -h' or 'iptables-restore --help'
> for more information.

You must need to specify -m tcp to access TCP match options such as
--tcp-flags.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

