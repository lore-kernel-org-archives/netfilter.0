From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: FTP through Firewall
Date: Sat, 04 Mar 2006 20:13:52 +0100
Message-ID: <1141499633.13945.33.camel@anduril.intranet.cartel-securite.net>
References: <20060304184727.92357.qmail@web54708.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060304184727.92357.qmail@web54708.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: dsylvesteriii@yahoo.com
Cc: netfilter@lists.netfilter.org

Le samedi 04 mars 2006 =E0 10:47 -0800, Davis Sylvester a =E9crit :
> I am trying to grant FTP access to Internet customers
> to our servers behind our firewall.
> When they try to connect they get the following error:
> ftp: connect :Unknown error number
[...]

Have you insmoded ip_conntrack_ftp and ip_nat_ftp (or build them into
kernel) ?


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!


