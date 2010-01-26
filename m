From: "Steven Kath" <steven.kath@vyatta.com>
Subject: RE: NOTRACK not working
Date: Tue, 26 Jan 2010 11:01:14 -0800 (PST)
Message-ID: <052FF749072D449D80F47E313C5FFD2D@skathlaptop>
References: <4B5F36B7.5010004@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B5F36B7.5010004@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'Dennis J.'" <dennisml@conversis.de>, netfilter@vger.kernel.org



> For a while now I excluded two IPs on my firewall from connection
tracking
> which works very well. Now I tried adding another IP but that doesn't
seem
> to work. I added the following rules:
> 
> iptables -t raw -A PREROUTING -s 192.168.10.10 -j NOTRACK
> iptables -t raw -A PREROUTING -d 192.168.10.10 -j NOTRACK
> 
> Yet when I look in /proc/net/ip_conntrack I still see 192.168.10.10
using
> up most of the entries.

Are the counters for your new rules incrementing?  Are you sure you're not
looking at entries remaining in the conntrack table from before you
applied the new rules?  

Perhaps new conntrack entries are no longer being created, but the old
ones remain.  I believe that the entries present before you added your
rule will not time out if the traffic persists.  

If so, and you have the conntrack-tools package available, you can use the
conntrack command to manually purge the undesired entries.  You could also
flush the table by removing and re-inserting any conntrack-related
modules, which would be a bit more disruptive. 
