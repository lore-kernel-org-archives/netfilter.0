From: Rohan Almeida <arc_of_descent@gmx.net>
Subject: reset /proc/net/dev
Date: Thu, 12 Sep 2002 17:13:05 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <14822.5325429395$1031832577@news.gmane.org>
Reply-To: arc_of_descent@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter <netfilter@lists.netfilter.org>


HI List,
How do i reset the values in /proc/net/dev ?
This file holds values for count of each (packet && byte),
(sent && received) through all interfaces.

I'm using a monitor which reads values from this
file and prints out some nicely formatted output.

But i need to reset the values. ie. set then to zero.
Restarting the network does not do what i want.
I guess a reboot should do it.

Any other way?

--
arc_of_descent

