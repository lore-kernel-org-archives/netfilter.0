From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Best Linux Intrusion Detection System
Date: Tue, 6 Dec 2005 08:38:15 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B316@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: elg3ne@dap.edu.ph, netfilter@lists.netfilter.org



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> elg3ne@dap.edu.ph
> Sent: Tuesday, December 06, 2005 12:59 AM
> To: netfilter@lists.netfilter.org
> Subject: Best Linux Intrusion Detection System
>=20
> Hi guys, I know this is a off topic but since Iptables is a=20
> security tool, I will ask this question with regards also on security.
>=20
> Here it goes.
> 1. what is the most commonly used LIDS system?
> 2. what is the best LIDS?
> 3. what is the most sophisticated LIDS?
> 4. what is the most easiest to setup?
> 5. what LIDS can you suggest on CentOS?
>=20
> thanks

The Focus-IDS group (www.securityfocus.com) is a better place for such
questions. However since I replied:

1. Probably Snort (www.snort.org) but I'm not positive. Snort is a NIDS,
of course, so if you are looking for HIDS then I couldn't tell you
(Tripwire maybe).
2. Depends on what you want. Snort is an excellent NIDS, once you
understand how to use it and turn off some rules which produce tons of
false positives.
3. Sophisticated? Dresses better, more feature bloat, slicker interface?
4. I'd spend the time understanding what's going on before worrying
about how easy an IDS is to set up.
5. Don't use it, so can't.

Derick Anderson

