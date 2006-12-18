From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Interesting article about punching holes in firewalls...
Date: Mon, 18 Dec 2006 08:26:53 +0100
Message-ID: <1166426813.8007.10.camel@anduril.intranet.cartel-securite.net>
References: <45860240.2040102@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45860240.2040102@riverviewtech.net>
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
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Linux Advanced Routing and Traffic Control <lartc@mailman.ds9a.nl>, Mail List - Netfilter <netfilter@lists.netfilter.org>

Le dimanche 17 d=E9cembre 2006 =E0 20:51 -0600, Grant Taylor a =E9crit :
> I personally have known that using "-m state --state=20
> ESTABLISHED,RELATED" was not the most secure thing to use for returning=20
> traffic.  Namely this will allow you to make a valid connection to a web=20
> server, say to retrieve a picture.  Then said web server could send=20
> malicious traffic back to your computer and pass through your firewall.=20
>   This is because the traffic coming from the web server to your=20
> computer is now deemed as RELATED.

How ? Afaik RELATED is used for two types of packets:

	. ICMP errors matching previously seen IP flow
	. First packet of expectations created through a helper

HTTP does not have any helper, this let ICMP goes through. Is it a
vuln ? I don't think so. However, remote server can refuse to close
connection and send further data using ESTABLISHED state. Well, how do
you prevent that from the firewall perspective ?

I must admit I quite don't see your point here. Can you elaborate a bit
please ? Thx.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

