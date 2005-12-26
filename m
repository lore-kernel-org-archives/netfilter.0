From: Daniel Firvida <dfirvida@gmail.com>
Subject: Problem with match extensions
Date: Mon, 26 Dec 2005 11:31:12 +0100
Message-ID: <8a6fb64c0512260231l107b1573u@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi

I have a problem with match extensions of iptables, concretely with
match of time
I have kernel version 2.6.9, iptables version 1.3.4 and the patch
patch-o-matic-ng-20040621 but I not with himself that the conditions
of time are executed.

The rules..

iptables -I INPUT 1 -s 143.56.34.X -m time --timestop 22:30 -j DROP
iptables -I INPUT 2 -s 143.56.34.X -m conntrack --ctexpire 50 -j DROP
# iptables -L -n
DROP       all  --  143.56.34.X          0.0.0.0/0           TIME to
22:30 on all days
DROP       all  --  143.56.34.X          0.0.0.0/0           ctexpire 50
...

They are accepted correctly by the system, but they are not freed when
it corresponds.
The system ignores the time rule or ctexpire completely

Some solution/idea ?=BF

Than you very much
A greeting

PD: escusme my bad english

