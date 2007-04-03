From: "Andi Reinbrech" <andi@darwinistic.com>
Subject: Re: --iif unrecognised in ROUTE target
Date: Tue, 3 Apr 2007 08:58:51 +0200 (SAST)
Message-ID: <5536.196.15.250.129.1175583531.squirrel@mail.darwinistic.com>
References: <3511.196.25.255.195.1175542625.squirrel@mail.darwinistic.com>
	<Pine.LNX.4.61.0704030745100.18387@yvahk01.tjqt.qr>
Reply-To: andi@darwinistic.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0704030745100.18387@yvahk01.tjqt.qr>
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
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Andi Reinbrech <andi@darwinistic.com>, netfilter@lists.netfilter.org

Hi Jan,

> Besides that it works for me, just what are you trying to accomplish
> that you need to rewrite it to "lo"?

Well, it's just a quick hack that I thought would be interesting if it
worked.  I have an outgoing ssh tunnel, but my sshd listens on 127.0.0.1
when the tunnel is initiated from the remote client.  I can't connect to
the remote client from another remote machine because ssh sits on lo and
not on eth0 or ppp0.  Since my ppp0 has a dynamic IP I can't hardwire the
listen address into sshd.conf - trying to listen on 0.0.0.0 didn't work
either.

Anyway, that's off-topic, I just wanted to see if I can rewrite the route
and make it magically route the packets to my remote machine.

Thank you!
Andi


