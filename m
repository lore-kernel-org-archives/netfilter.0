From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: Iptables bandwidth limit
Date: Fri, 20 Sep 2002 13:32:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209201332.51975.roy@karlsbakk.net>
References: <Pine.LNX.4.33.0209201316530.2343-100000@ns1.tegbrink.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0209201316530.2343-100000@ns1.tegbrink.com>
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
To: Daniel Cohen <cohen@ns1.tegbrink.com>, netfilter@lists.netfilter.org

On Friday 20 September 2002 13:17, Daniel Cohen wrote:
> Is it possible to set a bandwidth limit with IPTABLES. Lets say for
> instance that 10.1.204.49/32 should have maximum 100k speed to 10.1.10.=
30.
>
> Can iptables fix this?

nope

but iproute2, the ip util, QoS compiled into kernel etc can do. try googl=
ing=20
around for QoS howtos.

the TBF qdisc is fine for this. see=20
http://snafu.freedom.org/linux2.2/iproute-notes.html#syntcqtbf

roy
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


