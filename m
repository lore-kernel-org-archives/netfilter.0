From: "Michael P. Brininstool" <mikepb@hoplite.org>
Subject: RE: ip_conntrack problem?
Date: Fri, 8 Sep 2006 10:41:28 -0600
Message-ID: <004301c6d365$a5753f40$c84f949b@nasw.ds.army.mil>
References: <001001c6d296$eef8d4d0$c84f949b@nasw.ds.army.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <001001c6d296$eef8d4d0$c84f949b@nasw.ds.army.mil>
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

Not sure if this made it to the list.  If so, does anybody have any ideas?

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Michael P.
Brininstool
Sent: Thursday, September 07, 2006 10:02 AM
To: netfilter@lists.netfilter.org
Subject: ip_conntrack problem?

I have a Fedora Core 4 iptables firewall with 1 external interface, 1
wireless network interface, 1 DMZ interface and 2 internal interfaces.  I
have a mail server doing IMAPS and SMTP in the DMZ.
Employees on the outside and inside need to be able to reach both the SMTP
and the IMAPS servers.  For the most part the current set up works fine,
BUT.....

Every once in a while, those sending emails from thunderbird or outlook get
a message saying that their email was not sent, and their client requeues
the outgoing email and tries again.  It will try forever.....  What the
recipient sees is that (s)he receives many many copies of the email until
the sender deletes the message from the outgoing queue.

Fast Forward a month....I happen to notice log messages from the firewall
one day, that the ACK PSH FIN packet from the SMTP server was not getting to
the client that was attempting to send the email.  I looked at the DST port
of these packets and then looked at the ip_conntrack file in /proc and found
that the port was not listed.  But port numbers slightly higher were for
that node pair.

Fast Forward a week....I was watching this more often, and then found that
the DST port the SMTP server was attempting to send to WAS a valid
connection with hundred's of thousands of seconds before timeout.  Then for
no apparent reason, the entry in /proc/.../ip_conntrack with that DST port
suddenly disappeared as the TCP connection was being shutdown.  The iptables
firewall was blocking the ACK PSH FIN packet because it no longer considered
it a RELATED or ESTABLISHED connection.

Here is one line of output from my logs:

Aug 30 09:19:42 gateway kernel: DMZ2ENG_PACKET IN=eth1 OUT=eth2
SRC=172.20.1.33 DST=172.20.2.84 LEN=117 TOS=0x00 PREC=0x00 TTL=63 ID=42207
DF PROTO=TCP SPT=25 DPT=1098 WINDOW=32767 RES=0x00 ACK PSH FIN URGP=0

Any idea why the connection tracking is losing the record of the established
connection before the shutdown handshake is complete?  This is only
happening once in a while....
I do not appear to be running out of connection tracking memory....
This has recently been seen on IMAPS packets from the internal network to a
remote IMAPS server -- ACK PSH FIN packets coming back are being blocked as
unsolicited connections. -- I verified they were indeed valid connections
seconds before the packet was logged.

TIA!

--
Michael P Brininstool





