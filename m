From: Kevin Van Workum <kevin_vanw@yahoo.com>
Subject: udp port forwarding from internal network to internet
Date: Thu, 27 Jan 2005 05:00:55 -0800 (PST)
Message-ID: <20050127130055.38382.qmail@web30903.mail.mud.yahoo.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm new to netfilter and iptables and need to get
something up and running fast. I don't have time to
read up and learn the details right now.

I have one server machine connected to the internet
via a cable modem with a static IP and a small
internal network (10.0.0.0). All machines have the 2.4
kernel. I have a user who needs to run an application
on a few machines on the internal network. This
application needs to connect to a server located on
the internet via a udp port. How can I use iptables
(or a proxy or whatever) to do this?

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

