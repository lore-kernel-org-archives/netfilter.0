From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ff:ff:ff:ff:ff:ff mac problem
Date: Thu, 24 Jun 2004 09:54:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088063678.1865.23.camel@anduril.intranet.cartel-securite.net>
References: <1088063173.3839.10.camel@joel.d2visp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088063173.3839.10.camel@joel.d2visp.com>
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
To: Joel Solanki <zealous@bonbon.net>
Cc: netfilter <netfilter@lists.netfilter.org>

Le jeu 24/06/2004 =E0 09:46, Joel Solanki a =E9crit :
> ff:ff:ff:ff:ff:ff This mac address is creating problem in my network.
> Coz i cant find the ip address  of this mac address device.

FF:FF:FF:FF:FF:FF is the ethernet broadcast address. There's no device
associated to this MAC, and the IP address that could be associated to
it is an IP broadcast address.

Example : suppose LAN is 192.168.1.0/24, then sending packets to
192.168.1.255 will send frames to FF:FF:FF:FF:FF:FF.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

