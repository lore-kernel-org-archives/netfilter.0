From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: Performance tunning !
Date: Tue, 25 Jun 2002 12:20:28 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D1812B4.3050301@inbox.lv>
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
To: lartc@mailman.ds9a.nl, netfilter@lists.samba.org

hi all

i want to ask if changing the following will affect the perormance of a 
server having lartc netfilter and squid.. the system is on 512ram, 810 
intel chipset and p-III 800mhz handling a traffic of 2mbps( v call it 
internet cache gateway ) with kernel 2.4.18, RH-7.2
/pro/sys/net/ipv4/tcp_rmem
4096 16384 174760
/pro/sys/net/ipv4/tcp_wmem
4096 16384 131072
/proc/sys/net/ipv4/tcp_sack
1
/proc/sys/net/ipv4/tcp_timestamp
1

thanking in advance for ur help.
A.H


