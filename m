From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Netfilter Logs
Date: Mon, 03 May 2004 08:20:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083565200.1679.4.camel@anduril.intranet.cartel-securite.net>
References: <D4EF10CCEB2CE742BEEA9838C590B0E801AA2E30@ftrdmel2.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D4EF10CCEB2CE742BEEA9838C590B0E801AA2E30@ftrdmel2.rd.francetelecom.fr>
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
To: zze-KHOURY Jad FTRD/DMI/CAE <jad.khoury@rd.francetelecom.com>
Cc: netfilter@lists.netfilter.org

Le ven 30/04/2004 =E0 14:08, zze-KHOURY Jad FTRD/DMI/CAE a =E9crit :
>  I'm having some problems finding how to log ONLY iptable log messages
> to another file other than messages. So I made some changes in the
> "sylsog.conf" file by adding: kern.warning /var/log/firewall since the
> Default log level entry is" warning". But I still reveive some message
> other than the packets, from the kernel itself!

Yes.
If you still want to use syslog, then you have to set a custom level
that is not likely to interfer with other stuff, such as emergency.

>  how can I limit the input messages to only Netfilter packets?
> What should I change in the syslog.conf file If I don't want to
> receive Netfilter messages in this file?

man syslog.conf

Or use ULOG target and ulogd.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

