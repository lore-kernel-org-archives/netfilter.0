From: John Jung <john.j.jung@siemens.com>
Subject: Rate Limiting After a Threshold
Date: Thu, 05 Jul 2007 14:34:42 -0700
Message-ID: <468D63F2.7060402@siemens.com>
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

Hi,

   I'm new to IP Tables in general, but I've been able to whack away at the 
rules to get connlimit to do what I want.  Now I'm trying to do something 
more sophisticated, but it doesn't seem to work.

   My ultimate goal is to allow most Web users to access my site, but to slow 
down the abusers.  So, for example, I want to let in the first 10 HTTP 
connections in, and then after that, limit that IP to only 20 connections per 
minute afterwards.  (And then after a certain point, connlimit will block any 
additional connections by that IP.)

   I'm using a vanilla 2.6.21.3 Linux kernel, but I can't figure out how to 
do it.

   I think hashlimit is the key, but it really just doesn't want to work for 
me.  For example, I've tried:

     iptables -A INPUT -p tcp --dport 23 -m hashlimit --hashlimit 1/hour
       --hashlimit-mode srcip --hashlimit-burst 1 --hashlimit-name test
       -j REJECT

   but I can open up more than 1 telnet session in under a minute, let alone 
an hour.

   I've read and re-read the hashlimit man page, tried various arguments that 
I've found on on the Web, all to now avail.

   Any and all suggestions are welcomed.

   Thanks.

						John

-- 
+-------------------------------------+-------------------------------------+
| John Jung (john.j.jung@siemens.com) |    Siemens Automation and Drives    |
|           Support Engineer          |           UGS PLM Software          |
|       Customer Support - GTAC       |     10824 Hope Street, MS: 1177     |
|       Operating Systems Group       |      Cypress, California 90630      |
+--------------------------- +1 (800) 955-0000 -----------------------------+


