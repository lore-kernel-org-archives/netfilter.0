From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Preferred way of preserving firewall rules on system reboots?
Date: Thu, 13 May 2004 16:58:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084460291.1771.183.camel@anduril.intranet.cartel-securite.net>
References: <40A38ABF.4090907@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40A38ABF.4090907@pbl.ca>
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
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Cc: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Le jeu 13/05/2004 =E0 16:48, Aleksandar Milivojevic a =E9crit :
> What is your preferred way of preserving firewall configuration on=20
> firewall reboots?  I know this is probably distribution specific.

Every time I need to save the ruleset :

	iptables-save > /etc/firewall

Then, in a startup script (/etc/init.d/networking on my Debian), I add :

	iptables-restore < /etc/firewall


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

