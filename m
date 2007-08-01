From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: blocking access to port 22 when INPUT policy is ACCEPT
Date: Wed, 1 Aug 2007 09:30:04 +0100 (BST)
Message-ID: <Pine.LNX.4.58.0708010840140.20822@mail3.jubileegroup.co.uk>
References: <200708010731.l717Vte0020939@mail3.jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200708010731.l717Vte0020939@mail3.jubileegroup.co.uk>
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
To: netfilter@lists.netfilter.org

Hi there,

On Wed, 1 Aug 2007 Grant Taylor wrote:

> Wrong logic operator.  The question could also be written as "How do I
> block all connections not from the set A or B or C or ...".
>
> One way to achieve this is with the IPSet match extension (which I
> have not worked with, so this may not be syntactically correct).
>
> iptables -A INPUT ! -m set --set sshclients src -j DROP

Looks good to me.  Here's the most recent addition to my roughly two
dozen ipsets:

iptables -I INPUT 98 -m set --set BLOCKSET08 src -j DROP

(My BLOCKSET08 set blocks /8 IP ranges.  :)

FWIW I have currently block a little over 26,000 IP ranges in 25 sets
and the performance is fine on very modest hardware.

At present I believe there are some issues compiling ipsets and the
latest 2.6 kernels, probably worth looking before you leap.

--

73,
Ged.

