From: <bmcdowell@coxhealthplans.com>
Subject: TARPIT target
Date: Fri, 26 Sep 2003 15:45:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731F41374@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


I apologize in advance if this has already been addressed, but I can't =
seem to find the answer anywhere.  Yes, I looked in the docs and yes, I =
looked in the mailing list archive.  The latter was a tad difficult to =
search, though, as I had to try and parse that 84 MB file...  At any =
rate, here's my question:

How do I use the TARPIT target?

I have iptables 1.2.8 installed and working otherwise.  I'm running =
RedHat 9.

When I try and use
	'iptables -A FORWARD -j TARPIT'
I get
	'iptables: No chain/target/match by that name'

I have rebuilt the kernel, but I do not see an option for 'TARPIT' =
anywhere in the netfilter stuff.  Yes, I do have 'experimental' turned =
on.  I have also deleted iptables completely and used only the source to =
install it.

Any ideas?


Thanks,

Bob McDowell
IS Specialist
Cox HealthPlans, LLC
417.269.2848

Confidentiality Notice: This e-mail message (including any attachments) =
may contain confidential and privileged information, and is for the sole =
use of the intended recipient(s). Any unauthorized review, use, =
disclosure or distribution is strictly prohibited. If you are not the =
intended recipient, please notify the sender by replying to this e-mail =
message, permanently deleting the original message and destroying any =
hard copies of the original message that may have been created.


