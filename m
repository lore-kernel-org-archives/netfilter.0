From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPSEC and other non tcp/udp/icmp blocking
Date: Sun, 13 Oct 2002 02:05:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013010600.ROPW459.mta02-svc.ntlworld.com@there>
References: <42349.64.86.49.17.1034435865.squirrel@www.icafe.co.tz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <42349.64.86.49.17.1034435865.squirrel@www.icafe.co.tz>
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

On Friday 11 October 2002 11:45 pm, Mitesh P Choksi wrote:

> Dear All,
>
> How does netfilter work with other protocols apart tcp/udp/icmp?

Perfectly well.

> I am trying to either block or account IPSec traffic.

All you need to do is specify the relevant protocol in your rules, eg:

iptables -A FORWARD -p esp ...etc.....

You can still specify things like source & destination addresses, but of 
course there are no port numbers in anything except TCP & UDP.

Antony.

-- 

Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

