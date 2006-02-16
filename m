From: Clist <clist@uah.es>
Subject: tracking multiple ftp ports
Date: Thu, 16 Feb 2006 16:10:48 +0100
Message-ID: <200602161610.49288.clist@uah.es>
Reply-To: clist@uah.es
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi all,

I need to track ftp connections on port 419 and also normal port 21 conns.
Ive probed doing "modprobe ip_conntrack_ftp ports=21,419"

ftp at port 21/tcp  seems to work as always did  but 419/tcp and its related 
conecctions still get dropped.

My tcpdump shows 419/tcp conns are authorized and get passed to the server but 
related data connections get dropped.

my rules are like these:
...
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -d <internal_normal_ftp_server> -p tcp -m tcp --dport 21 -j ACCEPT
-A FORWARD -d <internal_419_ftp_server> -p tcp -m tcp --dport 419 -j ACCEPT
...

Other rules (+500) and services run Ok,

Anyone knows about managing unusual ftp connections.

Thanks

-- 
---------------------------------------------
Clister UAH
---------------------------------------------

