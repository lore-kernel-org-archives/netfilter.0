From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Fwd: Linux as router (Gateway Server)
Date: Sun, 13 Feb 2005 09:24:41 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019976@pxtvjoexd01.pxt.primeexalia.com>
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
To: Navneet Choudhary <navneetkc@gmail.com>, Josh Nerius <jnerius@gmail.com>
Cc: netfilter@lists.netfilter.org

Wouldn't it just easier to put a log statement before the drop so you
can see what iptables is dropping?  This might really simplify your
troubleshooting.

Besides Google, log files are your friends as well.  If your default
rule is to DROP everything but the log isn't catching anything then you
have another problem otherwise you'll know immediately which ports to
open.


Gary Smith



