From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: Remove established connections!
Date: Thu, 25 Nov 2004 11:55:35 -0500
Message-ID: <876ef97a0411250855352ef124@mail.gmail.com>
References: <1101374811.1347.49.camel@oracle>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101374811.1347.49.camel@oracle>
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
To: Marcus Andersson <iptables@wimlet.se>
Cc: netfilter@lists.netfilter.org

On Thu, 25 Nov 2004 10:26:50 +0100, Marcus Andersson
<iptables@wimlet.se> wrote:
> Is there any way I can remove these remembered connections so that when
> the rule is rewritten it will actually send all traffic that comes in on
> a specified port to the correct adress?

The ctnetlink patch can be used to delete an arbitrary conntrack
record. You can find that at netfilter.org in patch-o-matic.

-- 
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

