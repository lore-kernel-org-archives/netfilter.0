From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: Filter question
Date: Fri, 11 Feb 2005 15:17:09 -0500
Message-ID: <876ef97a0502111217791ca9f4@mail.gmail.com>
References: <000801c51075$86cc9660$dd00a8c0@cpq>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <000801c51075$86cc9660$dd00a8c0@cpq>
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
To: Charles Lewis <cjkjlewis@comcast.net>
Cc: netfilter@lists.netfilter.org

On Fri, 11 Feb 2005 13:08:59 -0700, Charles Lewis <cjkjlewis@comcast.net> wrote:
> Hi all,
> 
> Have found tons of info on blocking a single ip address using iptables.
> 
> Can anyone suggest a place to find how-to ALLOW from single ip address (or
> block).
> 
> Using BusyBox & iptables 2.4.  Wanting to allow port 25 traffic from 2
> blocks & 1 explicit ONLY.

Set the policy on the chain to DROP and then add ACCEPT rules for the
IPs you want to allow. Example:

iptables -P INPUT DROP
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -s 1.1.1.1 -p tcp -m tcp --dport 25 -j ACCEPT
iptables -A INPUT -s 1.1.1.2 -p tcp -m tcp --dport 25 -j ACCEPT
...

You get the idea.

-- 
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

