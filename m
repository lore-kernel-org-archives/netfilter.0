From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: to use or not to use stateful capabilities
Date: Tue, 06 Apr 2004 09:26:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081236391.3394.13.camel@anduril.intranet.cartel-securite.net>
References: <4486.1081234909@zworg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4486.1081234909@zworg.com>
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
To: __ Radien__ <radien@zworg.com>
Cc: netfilter@lists.netfilter.org

Le mar 06/04/2004 =E0 09:01, __ Radien__ a =E9crit :
> ByTheWay, about ftp service, do u mean that w/ iptables I can set such
> rules that can detect and pass the data connection corresponding to
> existing control-connection further than ordinary accepting
> control-conneciton to fwd.
> Does RELATED state match such cases?

Yes.
For FTP, the date connection first packet will have RELATED state, for
it complies to informations that were gathered within control connection
by ip_conntrack_ftp module, allowing you to match and accept it.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

