From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Problem w/ iptables on FC3
Date: Mon, 4 Jul 2005 09:49:36 -0500
Message-ID: <200507040949.36383.rob0@gmx.co.uk>
References: <1120487114.7207.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1120487114.7207.10.camel@localhost.localdomain>
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

On Monday 04 July 2005 09:25, John Sasso wrote:
> avail. Is this a bug?

Not likely.

> iptables --policy OUTPUT   DROP

Don't do this. How do you think it will help? Do you have untrusted 
local shell users? If so, you are doomed anyway. They will find an 
opening, get root, and get out as they wish. If it's just you on the 
machine, OUTPUT filtering is silly. Use self-control, not netfilter.

iptables -P OUTPUT ACCEPT

For the return packets, go stateful. An example is posted in the thread 
earlier today, Subject: help me. It's also given and explained in the 
Packet Filtering HOWTO.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

