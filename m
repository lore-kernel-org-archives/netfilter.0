From: "Glover George" <dime@gulfsales.com>
Subject: Bye and Packet Counters
Date: Fri, 27 Dec 2002 09:51:33 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c2adbf$d7d5ff80$6c00a8c0@blue>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

I asked this about a year ago, and never got any answer, except that
userspace api had been removed, or wouldn't be supported in favor of
netlink, or something.

Here's what I'm trying to do.  Pretty simple I would have thought.  I
have a program that runs, and listens to client machines for requests to
add DNAT entries.  These clients will use the DNAT entry, and when they
are done will simply delete them.  The problem is, I want the program to
know the byte and packet counters of each one of these rules and retain
them.  In other words, I want to know the byte/packet counters of the
total of ALL data that was transferred through all of the connections
that /ONLY/ my program made (any previous DNAT's before the program was
started I don't care about).  

Now with iptables -t nat -L -v I can get some packet counters, but not
the complete number.  Even still this would require constant polling
since before a delete, I could read the packet counters, but if I'm not
deleteing it, I would constantly have to poll it (the counters are
presented via a graphical interface, and will be polled every so many
seconds).  So you see, I can't just go running iptables constantly.

Is there a simpler way to do this?  Is there ABSOLUTELY NO userspace api
anymore?  Was there ever?  How easy would this be to implement with
netlink, could it be done with netlink?  If anyone knows, can you post a
link to more information for netlink

Thanks so so much in advance.



