From: Damon Gray <dgray@internap.com>
Subject: Re: p-o-m and connlimit
Date: Tue, 24 May 2005 09:39:46 -0400 (EDT)
Message-ID: <Pine.LNX.4.62.0505240937500.9615@dgray-test.acs.internap.com>
References: <000801c55e1c$911b7c40$040110ac@evenfall>
	<200505241522.05395.pvolkov@mics.msu.su>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-79754685-1134911773-1116941986=:9615"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505241522.05395.pvolkov@mics.msu.su>
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
To: =?koi8-r?b?8KPU0iD3z8zLz9cg4czFy9PBzsTSz9fJ3g==?= <pvolkov@mics.msu.su>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---79754685-1134911773-1116941986=:9615
Content-Type: TEXT/PLAIN; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

It is definetely a problem, however I have a simple patch for it,=20
sumerized in this thread:

http://lists.netfilter.org/pipermail/netfilter-devel/2005-May/019764.html

-Damon-

On Tue, 24 May 2005, [koi8-r] =F0=A3=D4=D2 =F7=CF=CC=CB=CF=D7 =E1=CC=C5=CB=
=D3=C1=CE=C4=D2=CF=D7=C9=DE wrote:

> Hello.
>
> I have the same problem, but nobody answered me, so I can not help you. S=
orry.
>
> BTW. I found interesting post in google:
> http://lists.netfilter.org/pipermail/netfilter-devel/2005-May/019764.html
>
> So now I'm not sure that it is safe to use connlimit. Can anybody confirm=
 that
> problem?
>
> And I'm also interested in how to patch kernel?
>
> 21 =ED=C1=CA 2005 19:48 Nothing wrote:
>> I try to deploy connlimit patch to the last version of kernel at the mom=
ent
>> - 2.6.11.8 ant iptables 1.3.1. I use last snapshot of p-o-m-ng ant when =
I
>> run "./runme connlimit" and specify kernel ant iptables source directori=
es
>> p-o-m says "already patched"?! But the patch is missing!? I tryed with l=
ast
>> official version of p-o-m, and again failed, but this time with error
>> message. Can anybody give me a jocker how to solve the problem?
>
> --=20
> Peter.
>
>
>
---79754685-1134911773-1116941986=:9615--

