From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: RELATED connections and the feeling of security
Date: Fri, 13 Apr 2007 16:31:04 +0200
Message-ID: <1176474664.9361.17.camel@anduril.intranet.cartel-securite.net>
References: <200704131202.27971.Hugo.Mildenberger@t-online.de>
	<1176463828.9361.14.camel@anduril.intranet.cartel-securite.net>
	<200704131457.59976.Hugo.Mildenberger@t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200704131457.59976.Hugo.Mildenberger@t-online.de>
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
To: Hugo Mildenberger <Hugo.Mildenberger@t-online.de>
Cc: netfilter@lists.netfilter.org

Le vendredi 13 avril 2007 =E0 14:57 +0200, Hugo Mildenberger a =E9crit :
> I base this solely on my observation and did not descend into sources unt=
il=20
> now.  But I am nearby sure that I had  not tried to establish an ftp=20
> connection to the site named in my original post. Even if so, following=20
> your remarks, should the ftp-conntrack helper expose arbitrary ports on=20
> the originating host?

There's a few conntrack helper around: FTP, IRC, H323, SIP, etc.

> Until today my understanding of this matter was, that the difference betw=
een=20
> related and established states would be, that within ESTABLISHED state=20
> ip-address and port are considered pairwise, while within RELATED state o=
nly=20
> ip-addresses are considered, making the described attack possible.

No that's not.

> Perhaps we could setup a test case? My equipment here has changed, and=20
> for the moment I have no shell access to my DSL router at the internet fr=
ont.

The very first step to me is reliably reproducing your issue.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

