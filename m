From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Brigde and Firewall with linux
Date: Thu, 11 Dec 2003 09:48:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071132494.781.19.camel@elendil.intranet.cartel-securite.net>
References: <007c01c3b98e$1f5e3c70$1e00a8c0@MERCURIO>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007c01c3b98e$1f5e3c70$1e00a8c0@MERCURIO>
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
To: Luca Scattin <luca@atlantenet.com>
Cc: netfilter@lists.netfilter.org

Le mer 03/12/2003 =E0 12:10, Luca Scattin a =E9crit :
> Noy I try to modify cleint packet address using SNAT
> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 192.168.0.21
> (example).
> but in the second interface i view allvays the original client
> packets....=20
> I mistake something but I don't know what.

On 2.6 kernels, output interface will be br0, not eth0. So you'll have
to use physdev match in order to have your rule work :

	iptables -t nat -A POSTROUTING -m physdev --physdev-out eth1 \
		-j SNAT --to 192.168.0.21

I don't know if this behaviour has been backported to 2.4 kernels. At
least, you can try ;)

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

