From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: Packets that should have been DNATted appearing in INPUT table
Date: Tue, 11 Jan 2005 19:33:23 +0100
Message-ID: <009601c4f80c$0cd15d40$4206a8c0@loki>
References: <Pine.LNX.4.05.10501111313200.7610-100000@darkstar.sysinfo.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

On Tuesday, January 11, 2005 7:16 PM,
R. DuFresne wrote:

> [...]
> at various links and sec websites on the net.  But,this can be
> confirmed with comparing these INPUT hits with his FORWARDED NAT hits
> in the logs, yes?

Great idea, but I think we can exclude malicious attempts: The source IPs of 
the "critical packets" all (without exception) have far more packets that 
were correctly forwarded (several 10 or 100) than dropped (just 1 or 2 in 
the same time).

Thank you very much,

Marius 


