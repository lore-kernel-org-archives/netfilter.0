From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Defeating NMAP Null scans (and Nessus scans).
Date: Wed, 22 Jun 2005 14:52:45 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506221442160.25356@yvahk01.tjqt.qr>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Ziemba <netfilter@ziemba.net>
Cc: netfilter@lists.netfilter.org


>I am attempting to secure a new machine and thought I did until I ran NMAP's
>Null scan (which sends no TCP flags).  NMAP was able to determine just about
>every port running on the machine, and Nessus found more (even though a
>standard TCP Connect and SYN scan found exactly what I wanted). 
>
>I tried a number of TCP Flag combination rules in IPTables attempting to
>filter out these scans and was unsuccessful.  Does anybody know how to
>successful conceal your machine from these scans (while still allowing the
>ports that 'should' be open to function correctly)?

Here's some code from my Very Own Firewall(tm), AS_IPFW.

# Rejects NULL and XMAS scan
#
function HANDLE_NMAP_SCAN() {
    # Remainder: soon to be replaced with function HANDLE_PORTSCAN 
    iptables -A INPUT -j REJECT --reject-with icmp-host-unreachable \
     -p tcp --tcp-flags FIN FIN -m state --state INVALID;
    iptables -A INPUT -j REJECT --reject-with icmp-host-unreachable \
     -p tcp --tcp-flags ALL NONE -m state --state INVALID;
}

# Reject about anything unnormal, given that you have conntracking.
#
iptables -A INPUT -j REJECT --reject-with host-unreach -p tcp ! --syn -m state 
--state INVALID;

^^ If someone thinks some packets might get lost in this last iptables 
command, please tell me.



Jan Engelhardt                                                               
--                                                                            

