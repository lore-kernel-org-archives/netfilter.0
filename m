From: "Hurley, Michael" <MHurley@law.uconn.edu>
Subject: RE: Logging
Date: Mon, 15 Mar 2004 10:56:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AD8D39C727CBD411BB2C0090273A727408F9F07A@mortimer.law.uconn.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Try something like this:

set logging to, for example,
iptables -A FORWARD -j LOG --log-level 7 --log-prefix "FORWARD: "

Then in /etc/syslog.conf:
kern.7	-/var/log/firewall



-----Original Message-----
From: Mario Udina [mailto:m.udina@libero.it]
Sent: Monday, March 15, 2004 10:51 AM
To: netfilter@lists.netfilter.org
Subject: Logging


Hello!

I have done some googling however did not manage to find out if there
is a way to define a file where iptables writes its logs.

As I read in the man the file where the logs are written is the kernel
log i.e. /var/log/messages

is there a way to send this output to another file in order to keep the
logs clean?

regards,
	Mario Udina
-- 
i would like to die as my gradfather did, quietly in his sleep
and not in panic and disbelief as the passengers of his bus.

