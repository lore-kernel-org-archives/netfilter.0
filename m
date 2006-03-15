From: "Thomas Raef" <traef06@ebasedsecurity.com>
Subject: RE: ipset not blocking
Date: Wed, 15 Mar 2006 08:42:16 -0600
Message-ID: <D2EA20593E6AAD4DA6D07DE0EC12D1610133D8@ebs-2200.ebasedsecurity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Thomas Raef <traef06@ebasedsecurity.com>, netfilter@lists.netfilter.org

I forgot to add:

I'm using ipset 2.2.8 version 2
Iptables v1.3.4
Kernel 2.6.15

If I change the iptables to the INPUT chain it blocks, but more than
just dst port 25, it blocks everything.

What am I doing wrong?


-----Original Message-----
From: Thomas Raef=20
Sent: Wednesday, March 15, 2006 7:22 AM
To: 'netfilter@lists.netfilter.org'
Subject: ipset not blocking

Please shed some light on this.

I was trying to use ipset to block incoming email from countries I don't
want to receive email from.

Here is my script:

/usr/local/sbin/ipset -N Blacklist nethash --hashsize 480000
/usr/local/sbin/ipset -N ports portmap --from 1 --to 1024
/usr/local/sbin/ipset -A ports 25
/usr/local/sbin/ipset -A Blacklist 41.192.0.0/16
/usr/local/sbin/ipset -B Blacklist 41.192.0.0/16 -b ports
/usr/local/sbin/ipset -A Blacklist 41.220.0.0/20
/usr/local/sbin/ipset -B Blacklist 41.220.0.0/20 -b ports
/usr/local/sbin/ipset -A Blacklist 41.220.16.0/20
/usr/local/sbin/ipset -B Blacklist 41.220.16.0/20 -b ports

And here is the section of my iptables:

# This is for testing ipsets
iptables -N BLOCKEDSMTP
iptables -A FORWARD -m set --set Blacklist src,dst -j BLOCKEDSMTP
iptables -A BLOCKEDSMTP -j LOG \
	--log-level info --log-prefix "BLOCKED SMTP "
iptables -A BLOCKEDSMTP -j DROP

However, it's not blocking anything. I only want to block destination
port 25 from this list of IP addresses.

If I do:

Ipset -T Blacklist 41.192.0.0

I get:

41.192.0.0 is in set Blacklist


Please help!

Thank you in advance.

Thomas J. Raef
e-Based Security, Inc.
www.ebasedsecurity.com
"You're either hardened, or you're hacked!"


