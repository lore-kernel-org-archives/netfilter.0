From: Leonardo <p0q0b0d@gmail.com>
Subject: Re: ICMP frag needed not forwarded to MSQ clients
Date: Thu, 26 May 2005 16:09:41 +0200
Message-ID: <3b1e6f4805052607095d2736c5@mail.gmail.com>
References: <3b1e6f48050525011730fa7e44@mail.gmail.com>
	<Pine.LNX.4.60.0505251222550.9513@darkstar.sysinfo.com>
	<3b1e6f480505260025707940fd@mail.gmail.com>
	<Pine.LNX.4.58.0505261355220.24500@blackhole.kfki.hu>
	<3b1e6f48050526054740113f78@mail.gmail.com>
	<Pine.LNX.4.58.0505261457260.24584@blackhole.kfki.hu>
Reply-To: Leonardo <p0q0b0d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0505261457260.24584@blackhole.kfki.hu>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On 5/26/05, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
>=20
> Can you verify by tcpdump that the ICMP packets do received on eth2?
> Can you see them going out on eth0? Anything in the kernel log?
>=20
> Best regards,
> Jozsef
> -

I'm currently sniffing on client and server side (eth0/2). Yes, ICMP
Frag Needed msg are received at eth2. However they are not received
from the client nor sent from eth0. The browser just hang, a session
is established but data is incomplete and finally it simply timeout...

Thank you!
--=20
Leonardo Arena

