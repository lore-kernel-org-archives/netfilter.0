From: "Leandro" <leandro@mail.webway.com.br>
Subject: Log Analyser
Date: Tue, 1 Jul 2003 15:30:31 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NFBBIHOFIMLCALNJNOOIGEHAECAA.leandro@mail.webway.com.br>
References: <1054903485.5356.7.camel@sandertje>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054903485.5356.7.camel@sandertje>
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
To: netfilter@lists.netfilter.org

Hi,

Does anyone know a tool that show logs from Iptables in a HTML Report?

I=B4m using Iptables Log Analyser, but I have found many errors when I was
working with a more powerfull server.

This tool works like this:

1 - It=B4s configured iptables log=B4s prefix
2 - A scheduled task (tail), read /var/log/messages and record these
informations in a MySQL DB
3 - An Web Interface shows the results.

But, because of the use of a powerfull machine, sometimes, the prefix isn=
=B4t
being showed correctly.

Does anyone know a solution for this?

Thanks in Advance

Leandro




