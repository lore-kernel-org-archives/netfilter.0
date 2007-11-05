From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Connection Stats per interface using iptables
Date: Mon, 05 Nov 2007 09:32:15 -0600
Message-ID: <472F377F.1040402@riverviewtech.net>
References: <971580.28281.qm@web1005.biz.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <971580.28281.qm@web1005.biz.mail.sp1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/05/07 02:09, Shyam Prasad wrote:
> Is there a way to directly fetch these stats using iptables rule or i 
> have to create separate chains for each interface ,redirect the 
> traffic to these interface specific chains and then calculate the 
> stats.

Yes you can use IPTables to gather this information for you.  IPTables 
its self does not keep track of this information, but you could easily 
write rules to act act as counters that you would then later check the 
number of packets they have matched.  You just need to add some rules to 
IPTables to match the input and / or the output interface and / or any 
other protocol information.

Depending on how many rules you are going to write, you may want to look 
at optimizing the rules a bit by creating a user defined chain for each 
interface.  With user defined chains you will not have to have packets 
traverse rules that they will never match.



Grant. . . .
