From: Jason Opperisano <opie@817west.com>
Subject: Re: msn and yahoo messenger voice chat
Date: Tue, 12 Apr 2005 13:03:16 -0400
Message-ID: <20050412170316.GA26811@bender.817west.com>
References: <1113309566.425bc17e6a46f@webmail.yanbulink.net>
	<20050412123940.GA26073@bender.817west.com>
	<001101c53f6f$a198e9c0$dc0aa8c0@winntpro>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001101c53f6f$a198e9c0$dc0aa8c0@winntpro>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Apr 12, 2005 at 05:55:13PM +0300, Wennie V. Lagmay wrote:
> Hi Jason just to inform you what have I learn with the configuration from
> you.
> With this rule:
> iptables A POSTROUTING -s 192.169.10.0/24  -j SAME --to
> xxx.xxx.85.113-xxx.xxx.85.115, it is intermitent, i mean sometimes it
> connects to voice but sometimes it does't.

try using the "--nodst" option:

  iptables -t nat -A POSTROUTING -s 192.169.10.0/24 \
    -j SAME --nodst --to xxx.xxx.85.113-xxx.xxx.85.115

-j

--
"Stewie: How deliciously evil. It's like something out of Stephen King.
 Stephen King: Now for my 300th novel, a couple... is attacked... by
 a giant lamp monster.
 Editor: You're not even trying anymore are you?"
        --Family Guy

