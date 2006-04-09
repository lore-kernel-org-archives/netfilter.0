From: clan@dominationtime.com
Subject: Redirecting packets based on source+destination ip's
Date: Sat, 8 Apr 2006 21:34:37 -0700 (PDT)
Message-ID: <4840.68.94.225.167.1144557277.squirrel@webmail.dominationtime.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

I have been trying to find a way with iptables to redirect a packet
created on a server to be sent to 1.1.1.1 instead of 2.2.2.2 but only if
the packet is coming from 3.3.3.3.

With the help of linuxquestions.org I have gotten to the point of using
DNAT where the packet redirects, but the determining factor is destination
address.  Not source.  Since this is a shared server(each user has a
different ip) it would be nice to only redirect certain ip's, but leave
the others alone.

In case I didn't make it understandable what I want to do here is what I
am trying to accomplish, I rent a server for running a battlefield 2
server.  This is of course shared, so there are other battlefield
instances running next to mine albeit on different ip's.  I want to run a
stats program that requires redirecting bf2web.gamespy.com to
212.77.171.103 so that when my server sends out stats they go to ABR
instead of EA.  The usual way of doing this is with a hosts file, but that
effects all ip's on the server, and causes some pretty big problems with
the other servers on the machine.

Here is what the guy at linuxquestions.org gave me to work with
iptables -t nat -A PREROUTING -t nat -p tcp -d 1.1.1.1 --dport 80 -j DNAT
--to 2.2.2.2

To make it work I had to change PREROUTING to OUTPUT.  So is there a way
for that to only effect certain source ip's?

Thank you so much,  Fourthbean


