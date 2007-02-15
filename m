From: Bart Duchesne <bd@able.be>
Subject: iptables performance
Date: Thu, 15 Feb 2007 20:48:55 +0100
Message-ID: <1171568935.13409.26.camel@burnout.office.dyndaco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hi,

We are running kernel 2.6.17 and using iptables 1.3.5 and are observing
a performance problem.

We have a netfilter firewall consisting of about 800 Chains and a total
of 10000 rules (iptables -nvL | wc -l).

A single iptables manipulation takes about 4 seconds (on a PIV 2Ghz with
1Gb DDR2 ram).

With the same firewall config (on slower hardware) in a 2.4.24 kernel
with iptables 1.2.9 the single iptables manip takes about 500ms.

I traced the iptables command in 2.6.17 and noticed that the 4 seconds
are actually lost in the setsockopt call to write the BLOB back to the
kernel (BLOB size 2Mb ; 11000 entries).

Does anyone has any idea what might be causing this slowdown ?
Has the kernel interface part changed dramatically between 2.4 and 2.6 ?
Is it correct to say that no traffic will pass through in those 4
seconds that the filter is updated ?


regards,

Bart Duchesne=20

--
Visit CeBIT 2007 =96 March 15-21, 2007 =96 Messe, Hannover, Germany =96 Sec=
urity Hall, Hall 7 Booth C20 and Banking and Finance Hall, Hall 17, Booth A=
01. For additional information, please visit the event section of VASCO's w=
ebsite http://www.vasco.com/events.

Infosecurity.be / Storage Expo=20
Belgium 21 & 22 March 2007 Brussels Kart
http://www.infosecurity.be   http://www.storage-expo.be  http://www.linuxwo=
rldexpo.be
=20


---------------------------------------------------
aXs GUARD has completed security and anti-virus checks on this e-mail (http=
://www.axsguard.com)
---------------------------------------------------
Able NV: ond.nr 0457.938.087
RPR Mechelen


