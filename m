From: Hugo Mildenberger <Hugo.Mildenberger@t-online.de>
Subject: Re: RELATED connections and the feeling of security
Date: Fri, 13 Apr 2007 14:57:59 +0200
Message-ID: <200704131457.59976.Hugo.Mildenberger@t-online.de>
References: <200704131202.27971.Hugo.Mildenberger@t-online.de>
	<1176463828.9361.14.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1176463828.9361.14.camel@anduril.intranet.cartel-securite.net>
Content-Disposition: inline
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

I base this solely on my observation and did not descend into sources until=
=20
now.  But I am nearby sure that I had  not tried to establish an ftp=20
connection to the site named in my original post. Even if so, following=20
your remarks, should the ftp-conntrack helper expose arbitrary ports on=20
the originating host?

Until today my understanding of this matter was, that the difference betwee=
n=20
related and established states would be, that within ESTABLISHED state=20
ip-address and port are considered pairwise, while within RELATED state onl=
y=20
ip-addresses are considered, making the described attack possible.=20

When this should be principally wrong (id est: only describing a somehow=20
messed reality but not the intention), then I would expect  the rub=20
whithin NAT helper code.

Perhaps we could setup a test case? My equipment here has changed, and=20
for the moment I have no shell access to my DSL router at the internet fron=
t.

Best Regards


Hugo Mildenberger



Am Freitag 13 April 2007 13:30 schrieb Cedric Blancher:
> Le vendredi 13 avril 2007 =E0 12:02 +0200, Hugo Mildenberger a =E9crit :
> > "iptables -A INPUT -m state --state ESTABLISHED, RELATED - j ACCEPT"
> > This means to allow inbound connections having nothing in common with t=
he
> > initiating outbound connection, except for the ip-address pair used by
> > the initiating connection, leaving your nominal firewalled systems
> > exposed to any malicious site you accidentally stumble on, whereas using
> > "ESTABLISHED" alone here would restrict connections to be outbound only.
>
> On what ground do you base this statement ? AFAIK, RELATED state applies
> to:
>
> 	. expectations created by protocol helpers such as FTP or IRC,
> 	  that therefore have "something in common with the initiating
> 	  outbound connection";
> 	. ICMP errors that match an existing conntrack entry, that again
> 	  have a relation with previously allowed connections.
>
> Behaviour you're referring to applies to the first category. As I have
> not check the code recently, could you specificly point some modules
> that create such unexpected and lax expectations ? Thoses would indeed
> be a serious security issue to me.

