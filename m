From: cc <cc@belfordhk.com>
Subject: udp port 135
Date: Thu, 14 Aug 2003 12:24:25 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F3B0EF9.5040002@belfordhk.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----------=_1060835265-32021-571"
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
To: Netfilter Group <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format...

------------=_1060835265-32021-571
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

Can someone comment on the following script as to whether or not
it should work?  (It's related of course to the influx of 135
scans..)

iptables -A INPUT -i $EXT_DEV -p tcp -d $EXT_DEV --dport 135 -j DROP
iptables -A INPUT -i $EXT_DEV -p udp -d $EXT_DEV --dport 135 -j DROP

iptables -A OUTPUT -o $EXT_DEV -p tcp -d $EXT_DEV --dport 135 -j DROP
iptables -A OUTPUT -o $EXT_DEV -p udp -d $EXT_DEV --dport 135 -j DROP

Perhaps my understand of UDP packets isn't very deep, so I
might have missed some tidbit regarding the states of udp ports.

But with the above script portion, when I execute:

nmap -sT -p 135 <ext ip>

from a remote machine, I get a host down message. With

nmap -sT -P0 -p 135 <ext ip>,

I get a (135/tcp filtered).  (Good news?)

But with :

nmap -sU -P0 -p 135 <ext ip>,

I get a (135/udp open).

Can someone explain to me what I'm doing wrong or what
information I have forgotten?    Does it even matter
if the udp 135 port is open?  I'm currently in
the process of closing all unneccessary ports
(be it tcp or udp).

Thanks.








** All information contained in this email is strictly     **
** confidential and may be used by the intended receipient **
** only.                                                   **


------------=_1060835265-32021-571--

