From: "Mark Steele" <msteele@inet-technologies.com>
Subject: ipt_string, udp, dns problem...
Date: Sun, 22 Sep 2002 05:34:24 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1292.24.200.104.128.1032687264.squirrel@www.funio.com>
Reply-To: msteele@inet-technologies.com
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
To: netfilter@lists.netfilter.org


Hi there,

I have a quick question regarding the iptables string module.

I'm currently under siege from a DOS attack which is aimed
at my name server. I believe the culprit is spoofing
his IP address, and sending DNS requests to various
recursive name servers for a domain which used to be
hosted in my servers. To block this, I am trying to use
a string match to drop the packets like so:

/usr/sbin/iptables -I INPUT -j DROP -p udp -s 0.0.0.0/0 -m \
string --string "militaire.org" --dport 53

I have noticed however, that this hasn't had much of a significant
effect, as my name server is still receiving the requests.

using "tcpdump udp dst port 53 -s 2000" I see:

17:56:39.071676 193.252.19.74.50963 > 66.199.166.5.53:  36126 A?
www.militaire.org. (35) (DF)

And the requests are getting through to my
name server. Any ideas on what I might
be doing wrong?

Here are the details:
kernel 2.4.19
iptables v1.2.7a
glibc 2.2.3
(Slackware 8.1)

Kernel options (on)
ip_tables
iptable_filter
ip_conntrack
ipt_state
ipt_LOG
ipt_string


Regards,


-- 
Mark Steele
Vice president recherche et developpement
Inet Technologies Inc.




