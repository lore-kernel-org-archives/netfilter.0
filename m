From: "Jason Sigurdur" <Jason.Sigurdur@aspenview.org>
Subject: H323 patch
Date: Tue, 7 Mar 2006 11:06:36 -0700
Message-ID: <648A21EA469E3848922D9860785CD5EF23D489@aspen-mail01.aspenview.org>
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
To: netfilter@lists.netfilter.org

Hi, In regards to the h323 patch by 'Jing Min Zhao'. Using FC4
2.6.15-1.1833_fc4smp.

I downloaded the rpm source installed it, patched it ,make modules;make
modules_install,restarted the system. "I had to do a depmod after the
system was restarted, modprobe could not find ip_nat_h323?

Anyway I loaded the ip_nat_h323, and did a simple test using netmeeting.

The linux system did a 'stack dump' and locked up.

Unfortunately, I could not post to sourceforge/nath323 was down?=20

Any suggestions appreciated,

jason

