From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: about iptables log messages
Date: Tue, 10 Sep 2002 10:52:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209101052.41637.roy@karlsbakk.net>
References: <F188RTiCSR9OgSNnByU00005d52@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F188RTiCSR9OgSNnByU00005d52@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: SB CH <chulmin2@hotmail.com>, netfilter@lists.netfilter.org

On Tuesday 10 September 2002 10:17, SB CH wrote:
> Hello all.
> I would like to save iptables log messages into mysql database and see =
the
> result via php or cgi web site.
> Do you have any solutions or related site?

I beleive this would work fine by (a) using -j ULOG and (b) creating a sm=
all=20
perl/php/python/whatever script to log this into some dbms (preferably=20
postgreSQL as mysql sucks big time :-)

roy

--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


