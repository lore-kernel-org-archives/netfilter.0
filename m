From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Preventing port scanning
Date: Wed, 7 Apr 2004 19:57:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404071957.15692.Antony@Soft-Solutions.co.uk>
References: <000001c41ccc$1eae1dd0$0464a8c0@stu>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c41ccc$1eae1dd0$0464a8c0@stu>
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
To: netfilter@lists.netfilter.org

On Wednesday 07 April 2004 7:14 pm, Stuart Lamble wrote:

> Hi All
>
> Is it possible to prevent people from port scanning my firewall to see
> whats open?

<pedant>You can't prevent them port scanning your firewall, no,</pedant> 
however you can prevent them getting any positive answers simply by ensuring 
that all the ports are closed.

(If, for some reason, you need to have some ports open for external access to 
your network, then no, you cannot prevent people from discovering this.)

You might try using some sort of tarpit rules to bog down a naive port scanner 
which scans multiple ports in a short period of time, however these will have 
no effect on scanners which are only looking for a small number of ports 
(such as 21,22,23,25,53,80,110,119,143 for example).

Regards,

Antony.

-- 
Your work is both good and original.  Unfortunately the parts that are good 
aren't original, and the parts that are original aren't good.

 - Samuel Johnson

                                                     Please reply to the list;
                                                           please don't CC me.


