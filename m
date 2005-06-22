From: "Jason Ziemba" <netfilter@ziemba.net>
Subject: Defeating NMAP Null scans (and Nessus scans).
Date: Wed, 22 Jun 2005 08:28:03 -0400
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: 
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

I am attempting to secure a new machine and thought I did until I ran NMAP's
Null scan (which sends no TCP flags).  NMAP was able to determine just about
every port running on the machine, and Nessus found more (even though a
standard TCP Connect and SYN scan found exactly what I wanted). 

I tried a number of TCP Flag combination rules in IPTables attempting to
filter out these scans and was unsuccessful.  Does anybody know how to
successful conceal your machine from these scans (while still allowing the
ports that 'should' be open to function correctly)?


