From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Problem with sendmail server behind firewall...
Date: Fri, 5 Sep 2003 08:40:08 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DKEDJAAMDCDBHFKPBEMPKEHCCIAA.markee@bandwidthco.com>
References: <20030905062950.M87452@ahm.cmc.net.in>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20030905062950.M87452@ahm.cmc.net.in>
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
To: Pradeep Bhomia <pradeepbhomia@ahm.cmc.net.in>, netfilter@lists.netfilter.org

It sounds to me, based on the number of processes being generated, that you
may have the classic IDENT (AUTH) problem when sendmail is NATed behind a
firewall.  The IDENT (AUTH) protocol is often necessary for the smooth
performance and functioning of certain services such as mail, POP3, ftp, and
IRC.  This is particularly the case for sendmail in its default
configuration.  For instance, when sending outgoing mail, the receiving mail
server attempt to IDENT the sending mail server on TCP 113 SYN. Problems
occur when the incoming IDENT SYN packets are dropped at the firewall, or
not DNATED to the mail server, as the receiving mail server will wait for a
SYN/ACK reply to the TCP 113 connection request until it times out. IDENT is
a security concern so IDENT requests should normally not be answered, and
yet they cannot be dropped if service is to function properly.
SOLUTIONS:
1) If the firewall has the capability, which netfilter does, REJECT instead
of DROP IDENT requests at firewall, and return a RESET/ACK
back to the requesting server.  The server will then be
satisfied and continue processing the delivery.
2) If the firewall does not have this capability, a TCP 113
hole must be poked through the firewall for INBOUND IDENT requests. Then
direct the TCP 113 requests to the mail relay server wherein the IDENT
service has been disabled. The non-listening IDENT port on the server with
then cause the TCP stack to return a RESET/ACK packet to the requesting
server.
3) OUTBOUND IDENT requests (TCP 113) must also be allowed  through, as well
as inbound IDENT replies, high port RESET/ACKS,
and ICMP "port unreachables".

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Pradeep Bhomia
Sent: Thursday, September 04, 2003 11:40 PM
To: netfilter@lists.netfilter.org
Subject: Problem with sendmail server behind firewall...


We are facing problem with the sendmail server when it is put behind the
iptables firewall.
The setup is:
Sendmail 8.12.9
IPTables 1.2.7
Shorewall 1.3.14

Earlier Sendmail server was connected directly to the Internet with a valid
Internet IP. At that time the number of sendmail processes never exceeded 10
at any given poing of time. (Checked with ps -ef | grep sendmail)
Now we have implemented the Mandrake Linux 9.1 based firewall using IPTables
and Shorewall. NATting was configured on the firewall. After doing this, we
have observed that the number of sendmail process keeps on increasing and
goes upto nearly 170 processes. It seems that the problem is with the
incoming message requests. It process remains open for nearly 2 hours. This
is observed for random connections or some particular sites.
As such sendmail server is receiving and sending mails without any problem
to
the users.
After I remove the firewall and put the server directly on the internet the
sendmail processes remain at less than 10.

I have been working on this problem for last two days without success. I
cannot understand whether the problem is with the implementation of firewall
(NATting) or with sendmail server. I have checked the firewall with only
NATting (removed all the rules)

Kindly help.

Thanks and regards,

Pradeep Bhomia



