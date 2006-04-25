From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: IPTABLES and outlook express
Date: Tue, 25 Apr 2006 14:05:15 +0200 (CEST)
Message-ID: <51025.193.173.147.3.1145966715.squirrel@webmail.sterenborg.info>
References: <444E0628.3070002@phoenixlogin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <444E0628.3070002@phoenixlogin.com>
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

On Tue, April 25, 2006 13:21, Ravi Kumar wrote:
> Hi GUYS,
>
> Please help me setup iptables to access pop and smtp ( outlook express)
> when going through squid proxy server.

When using smtp and pop I don't think you'll be using Squid. And if you w=
ould,
this would be the wrong mailinglist for asking support.

You fail to say what your setup is and what you have tried already but I =
guess
you need this :
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -m state --state NEW -p tcp --dport 25 -j ACCEPT
$ipt -A FORWARD -m state --state NEW -p tcp --dport 110 -j ACCEPT

You can read up on Netfilter at :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Gr,
Rob



