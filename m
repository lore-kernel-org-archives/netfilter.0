From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: read and set static ARPs
Date: 24 Jul 2003 08:44:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059029075.1177.2.camel@elendil.intranet.cartel-securite.net>
References: <BAY1-F57pfTYSl1q4gt00000109@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY1-F57pfTYSl1q4gt00000109@hotmail.com>
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
To: Javier Garza <ejgg71@hotmail.com>
Cc: netfilter@lists.netfilter.org

Le mer 23/07/2003 =E0 21:29, Javier Garza a =E9crit :
>   somebody know which is  the   patched version of the Red Hat=20
> /etc/init.d/network
> script which read and set static ARPs from a file, /etc/init.d/static-a=
rp.

Just fill /etc/ethers file and add a command such as :

	/usr/sbin/arp -f /etc/ethers

to your startup script.

If your file is /etc/init.d/static-arp, then :

	/usr/sbin/arp -f /etc/init.d/static-arp

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

