From: Larry Alkoff <labradley@mindspring.com>
Subject: Nice ZoneAlarm that might be useful for Iptables
Date: Mon, 30 May 2005 22:53:03 -0500
Message-ID: <429BDF9F.7070707@mindspring.com>
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
To: Netfilter <netfilter@lists.netfilter.org>

There is a nice feature of Zonealarm for Windows that will check 
outgoing packets, and if that program sending is not on their list, ask 
if you want to allow that program to access the web.

In addition, it will warn if a program is asking for server rights 
although and ask for approval to grant that, although I don't understand 
what they mean by "server rights".

Most Iptables scripts I've seen do very little OUTPUT filtering which 
means a malicious program, if it got access somehow, could have free 
range to send packets out.  Zombie or spyware perhaps.

The ability to block this by only allowing "approved" programs to access 
the Internet would be a nice addition to Iptables.

I heard this could be done in userspace with the QUEUE target in 
iptables although I haven't been able to dig up much information about 
QUEUE and it's use.

Does anyone have some ideas on how to implement this?

If I had some ideas I'd be willing to take a first cut at it.  I know 
just enough Iptables to be dangerous <g>.

Larry

-- 
Larry Alkoff N2LA - Austin TX
Using Thunderbird on Slackware Linux

