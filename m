From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: not able to ssh from the firewall
Date: Mon, 11 Sep 2006 10:29:30 +0200 (CEST)
Message-ID: <60586.193.173.147.3.1157963370.squirrel@webmail.sterenborg.info>
References: <001701c6d2c0$4d588b00$0101000a@tanjian>
	<1157854906.4748.4.camel@nirvana.aurokruti.in>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1157854906.4748.4.camel@nirvana.aurokruti.in>
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

On Sun, September 10, 2006 04:21, varun wrote:
> Yes I did all that you suggested.
> I think OUTPUT should allow tcp and udp out ? What do you think ?

It should allow out what you need, but most people leave it's policy to A=
CCEPT
without any rules because it's easier.
AFAICS, when you have the appropriate state rules in the INPUT and OUTPUT
chain, having an ACCEPT rule for tcp dport 22 should allow you to setup a=
 ssh
connection to a remote server. Having ACCEPT rules for tcp/udp dport 53 s=
hould
enable you to do DNS lookups.

Again, if that doesn't work, insert a logging rule to the end (before the
DROP) of the chain to see *what* get's dropped (and post it here).


Gr,
Rob



