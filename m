From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Wol Magic Packets
Date: Tue, 29 Aug 2006 13:55:33 +0200 (CEST)
Message-ID: <64876.193.173.147.3.1156852533.squirrel@webmail.sterenborg.info>
References: <J4RCCQ$90300DFBE572C56BB53FC8E3AEB5BD68@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <J4RCCQ$90300DFBE572C56BB53FC8E3AEB5BD68@libero.it>
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

On Tue, August 29, 2006 13:38, claudio987\@libero\.it wrote:
>>> packet enters only if I send it to a port opened into the router...: =
for
>>> example: if I forward port 30 tcp\udp to
>>> 192.168.0.2 (pc of my lan) and I send a wol packet for
>>> another internet address out of my lan to poty 30 of external ppp0
>>> interface of my router, pc 192.168.0.2 turns on
>>>
>>
>> Yes, well, you've said that before and as I said: if these *do* enter
>> your network then I don't know how to block them. Perhaps you can sear=
ch for
>> the String match (it's in an older POM-ng and which I never used) and =
try to
>> catch those WOL packets by matching it's contents. Since each WOL pack=
et
>> looks the same (6 bytes FF followed by 16 bytes containing the MAC add=
ress
>> of the PC to wake up), you should be able to do it.
>>
>> Gr,
>> Rob
>>
> how can I do it?

By downloading a kernel, POM-ng (patch-o-matic-ng) and an older POM-ng th=
at
still has the string patchlet, and iptables. Patch the kernel using the o=
lder
POM-ng for the string match and use the newer POM-ng for recent stuff. In=
stall
the new kernel and iptables and see if everything (still) works.

If you've never done this I suggest you search the internet for howto's, =
read
the README's and/or INSTALL files and try it with a test-PC first.
Howto's on patching a kernel is not really the scope of this list.



