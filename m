From: "Tomas Daniska" <tomas@tronet.com>
Subject: ip_nat_snmp_basic
Date: Thu, 24 Feb 2005 14:25:44 +0100
Message-ID: <A5ED43533E983E4685C9E6156BE8874FB255AA@kenya.tronet.as>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org



hi all,


has anyone managed to get it working as expected?


so far i have been able to find several threads with about the same
symptoms, but none of them resolved.



i can confirm the module registers the helpers correctly (after adding
some printk() stuff), but nat_helper() is never called, regardless of
how i had set up the nat rules



thanks for any points

--
=20
Tomas Daniska
systems engineer

Tronet, a.s.
Plynarenska 5, 829 75 Bratislava, Slovakia
tel: +421 2 58224111, fax: +421 2 58224199
=20
Nobody ever got rich by telling the American public that what they had
was good enough and that they really didn't need anything better!
-- Bob Atkins

