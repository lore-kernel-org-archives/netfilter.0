From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: Re: iptables crashes server?
Date: Tue, 05 Apr 2005 08:47:34 +0200
Message-ID: <42523486.7000107@uplink-verein.ch>
References: <4250F7E0.3070203@uplink-verein.ch>
	<1403218a05040404475c810345@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a05040404475c810345@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

i checked the memory usage a little more in detail:

the free ram is decreasing.
the active use of ram is increasing.

ergo, something is filling up my ram. i run apache, irc-proxy, snort and =
argus besides iptables.

for me, there seems something buggy in the kernelspace of iptables.

but, if i am the only one with this problem, it's maybe not.

can someone tell me, which kernel and which iptables version is working?

regards
moritz

Mohamed Eldesoky wrote:
> Can you check the memory ??
> May be it is a faulty RAM
>=20
> On Apr 4, 2005 10:16 AM, Moritz Gartenmeister <moritz@uplink-verein.ch>=
 wrote:
>=20
>>hi all
>>
>>i'm running linux 2.6.11.3 and iptables 1.3.1 with pom 20050321. i patc=
hed the kernel with ipp2p,
>>and layer-7 patch.
>>
>>the server is running as a bridge and is working absolutly fine. after =
a while (there is no specific
>>time limit) the server crashes. the server is no more able to allocate =
new memory and even swapping
>>doesn't help. in this state i am unable to log in, i have to push the p=
ower button.
>>
>>i don't see heavy traffic before a crash and i don't see any flooding. =
is there a known memory leak
>>problem?
>>
>>i checked /proc/sys/net/ipv4/netfilter/ip_conntrack_count this number i=
s in the range of 2'000 - 5'000.
>>i checked /proc/slabinfo <active_objs> is more or less similiar to ip_c=
onntrack_count, <num_objs> is
>>the maximum of ip_contrack_count.
>>i also was checking /proc/meminfo and there was no steady increase.
>>
>>/var/log/messages shows no warning.
>>/var/log/syslog shows nothing
>>icmp is working.
>>imap is probably working (someone told me).
>>http is not working.
>>pop over ssl is working (sometimes).
>>
>>does anyone had/have the same experience? or does anyone have some hint=
s for further steps?
>>
>>hardware: dell poweredge 2560 with 2gybte ram, 2 xenon dual cpus.
>>
>>i was running the same setup wiht an older kernel 2.6.7/10 without much=
 troubles.
>>
>>regards
>>moritz
>>
>>
>=20
>=20
>=20
>=20

--=20
Uplink student association
Moritz Gartenmeister
B=FClachstrasse 1 F
8057 Z=FCrich
Switzerland

