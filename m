From: <bmcdowell@coxhealthplans.com>
Subject: IPTables Logging Advice
Date: Fri, 19 Dec 2003 16:06:19 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731012C66C5@coxhpexg.coxhp.com>
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


Is anyone reading the list willing to give some advice on logging and =
analyzing iptables data?  I have a set-up that isn't very good, takes a =
lot of effort to maintain, and is outgrowing the amount of time I'd like =
to spend on it.  I'm toying with the idea of pulling it all up by the =
roots and starting again.

Has anyone used ulogd to log to mysql?  Can it be done to Oracle =
instead? (If not, I suppose that I can do exports)  How do you mitigate =
the DMZ issues?  (I hate holes in my firewalls)  Would you mind helping =
a poor soul who doesn't quite 'get' the ulogd documentation?  Is there a =
tutorial somewhere?  Is there something better?

My ideal logging solution would be to take data from all of my firewall =
layers and load it into a database.  From that database, I'll draw =
reports, do trending, and do some real-time alerting.  Something similar =
to ACID for snort, except I'll handle the database and reporting part =
(we've actually got some really good tools for this already, I just want =
to apply them against log data).


Thanks in advance,

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


