From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: what does this message mean ?
Date: Mon, 17 Jun 2002 17:58:09 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D0DD5D9.4070505@inbox.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

hi all,

while checking /var/log/messages i found the following line.
what dooes this mean ?
Jun 17 12:18:09 cab1 kernel: conntrack_ftp: partial PORT 2281329+11
all the iptablesoprions r compiled in( i usually use modules but this 
time i didnt).

i also want to tell the list that using iptables-1.2.6a solved one of 
the mesages i was getting in messages file, which looked like this & was 
using iptables ==> iptables v1.2.7-2--2-423
May 30 05:09:58 cab1 kernel: ASSERT: ip_nat_core.c:840 
&ip_conntrack_lock not readlocked
(this message was posted on fri31,2002).but i really dont know why it 
happened !

thanking in advance
A.H


