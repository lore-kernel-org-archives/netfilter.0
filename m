From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: ip_contrackt message
Date: Sat, 30 Aug 2003 22:21:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DKEDJAAMDCDBHFKPBEMPGEAMCIAA.markee@bandwidthco.com>
References: <3F4D1828.8070605@nas.at>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F4D1828.8070605@nas.at>
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
To: ea@nas.at, netfilter@lists.netfilter.org

Can't say I've ever seen this before but I might venture to guess you State
Table has filled up and can accept no more connections.   The number of
connection allowed by default is determined by the amount of RAM your
machine has, i.e. 128 MB of RAM you will get 8192 possible entries and with
256 MB of RAM you will get 16376 entries, etc. You might try increasing the
number of permitted table entries by setting
/proc/sys/net/ipv4/ip_conntrack_max to a
higher number and see if the system corrects itself.  This is just a guess.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Erwin Ambrosch
Sent: Wednesday, August 27, 2003 1:44 PM
To: netfilter@lists.netfilter.org
Subject: ip_contrackt message


Hi all,

I'm using iptables-1.2.5-3 and got the following messages in my logfile.
Please can one say me what exactly does this mean.

....
Aug 27 16:28:59 paul kernel: NET: 6 messages suppressed.
Aug 27 16:28:59 paul kernel: ip_conntrack: table full, dropping packet.
Aug 27 16:29:04 paul kernel: NET: 7 messages suppressed.
Aug 27 16:29:04 paul kernel: ip_conntrack: table full, dropping packet.
Aug 27 16:29:08 paul kernel: NET: 7 messages suppressed.
Aug 27 16:29:08 paul kernel: ip_conntrack: table full, dropping packet.
Aug 27 16:29:14 paul kernel: NET: 9 messages suppressed.
Aug 27 16:29:14 paul kernel: ip_conntrack: table full, dropping packet.
Aug 27 16:29:19 paul kernel: NET: 7 messages suppressed.
Aug 27 16:29:19 paul kernel: ip_conntrack: table full, dropping packet.
....


Thanks in advance

Erwin





