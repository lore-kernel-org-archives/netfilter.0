From: Daniel <sertys@supportivo.org>
Subject: Re: Traffic counts wrongly in OUTPUT.
Date: Sat, 05 Mar 2005 12:36:11 +0200
Message-ID: <opsm5uelt8do0wqz@supportivo.org>
References: <20050305071603.GA26850@(none)>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050305071603.GA26850@(none)>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sat, 5 Mar 2005 17:46:03 +1030, <deniska@westnet.com.au> wrote:

> Hi,
>
> My counter in OUTPUT grows with >10MBytes/sec but I have only 64kbit of
> bandwidth. I have QoS shaping outgoing traffic, so, my guess is, the
> kernel sends packets as quick as possible but most of them are
> dropped in a queue by QoS.
>
> Now the question: is it possible to obtain the correct value of
> out-counters in iptables?
>
> Regards,
> D.

Where do you account these 10Mbytes per second? What tool do you use? Wha=
t=20
kind of shaping discipline you use? I suppose a simple TBF may sort you=20
problems out. The bottleneck with those modems is their ethernet=20
subinterface, which tends to provide 100Mbit/sec, but the modem can uploa=
d=20
just a tiny bit of those. An egress classless qdics will fix your=20
problems. TBF of pfifo_fast which is default.


--=20
Using M2, Opera's revolutionary e-mail client: http://www.opera.com/m2/

