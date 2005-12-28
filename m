From: James Garrison <jhg@athensgroup.com>
Subject: When is a connection ESTABLISHED in ip_conntrack?
Date: Wed, 28 Dec 2005 11:08:47 -0600
Message-ID: <43B2C69F.1040902@athensgroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Partial listing of ip_conntrack:

> tcp      6 296619 ESTABLISHED src=10.56.8.1 dst=10.56.8.218 sport=39594 dport=80 packets=1 bytes=40 [UNREPLIED] src=10.56.8.218 dst=10.56.8.1 sport=80 dport=39594 packets=0 bytes=0 mark=0 use=1

> tcp      6 296616 ESTABLISHED src=10.56.8.1 dst=10.56.8.183 sport=39594 dport=80 packets=1 bytes=40 [UNREPLIED] src=10.56.8.183 dst=10.56.8.1 sport=80 dport=39594 packets=0 bytes=0 mark=0 use=1

> tcp      6 296616 ESTABLISHED src=10.56.8.1 dst=10.56.8.179 sport=39594 dport=80 packets=1 bytes=40 [UNREPLIED] src=10.56.8.179 dst=10.56.8.1 sport=80 dport=39594 packets=0 bytes=0 mark=0 use=1

These are left over from a portscan I ran 2 days ago, and there's an
entry in ip_conntrack for each and every unused IP address on our
internal subnet.  Why is the connection status 'ESTABLISHED' if
there was never a response to the original SYN?  This causes
ip_conntrack to use the 5-day timeout instead of 2 minutes and
clutters up the table.

This isn't really a problem, I'm asking out of curiosity and to
better understand connection tracking.

-- 
James Garrison                                Athens Group, Inc.
mailto:jhg@athensgroup.com                    5608 Parkcrest Dr
http://www.athensgroup.com                    Austin, TX 78731
PGP: RSA=0x92E90A3B DH/DSS=0x498D331C         (512) 345-0600 x150


