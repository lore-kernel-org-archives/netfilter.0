From: Old Cowhand <oldcowhanddoug@yahoo.com>
Subject: DNAT question
Date: Thu, 11 Mar 2004 18:14:55 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040312021455.35089.qmail@web21323.mail.yahoo.com>
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello everyone--

I have what should be a simple configuration for
proxy, but it doesn't seem to work, and I don't know
why.  I've reproduced the problem in multiple
locations with different 2.4 kernels.  Here's the test
layout in ASCII (I hope you're using monospaced
fonts!):

                                   |--Web server
       eth0                   eth1 |  192.168.64.15/24
PC---------------Linux 2.4.19-------
172.16.1.2/30    172.16.1.1/30     |
                 192.168.64.1/24   |--Web server
                                      192.168.64.5/24

My DNAT rule:

iptables -t nat -A PREROUTING -s 172.16.1.2 -d
192.168.64.5 -p tcp --dport 80 -j DNAT --to
192.168.64.15

In tcpdump, I see the HTTP request come from the PC
with a destination of .5 on eth0.  I see the DNAT rule
match in iptables -L -n -v -t nat.  I see the HTTP
request go on eth1 to .15 (DNAT rule works).  I see
the HTTP server at .15 reply to 172.16.1.2 on eth1.=20
The data is dropped and never returned after that.=20
The reply never appears on eth0.

ip_conntrack shows SYN_SENT [UNREPLIED] on that
connection.

A few notes:

1) The PC can talk directly to .15's Web server with
no problems.  Routing is just fine.

2) If I configure .5 on the Linux box and ditch the
second Web server, everything works normally.

3) The DNAT rule is the ONLY iptables rule in place.

4) I have no dynamic routing, proxy arp, route filters
or other configurations in place.  It's simple static
routing.

I'm stumped.  Ultimately, I want to be able to take IP
addresses for my customers and point any Web requests
to a server that returns a page saying "Sorry, you
didn't pay your bill."  That's why #2 above won't work
for me in the long run.

Does anyone have any ideas?

Thanks in advance,

Doug

__________________________________
Do you Yahoo!?
Yahoo! Search - Find what you=92re looking for faster
http://search.yahoo.com

