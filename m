From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: How to keep record of repeat attackers?
Date: Wed, 12 Mar 2003 22:24:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303122224.55297.netfilter@newkirk.us>
References: <PKEJLPJCFBFLJJPHMGPIGEBBCAAA.please.help.me@comcast.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <PKEJLPJCFBFLJJPHMGPIGEBBCAAA.please.help.me@comcast.net>
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
To: George Chacon <please.help.me@comcast.net>, Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wednesday 12 March 2003 08:20 pm, George Chacon wrote:
> Hi,
>
> I'm an iptables newbie, and have a question about logging repeat
> offenders. Is it possible to have my firewall box remember incoming IP
> addresses, and generate a report showing which attackers keep coming
> back?
>
> Thank you,
>
> George Chacon

With iptables there are only two ways to do record information (apart=20
from simply the packet/byte counts that match each rule):  the LOG=20
target (formatted header information, basically, written to syslog) or=20
the ULOG target with an external accounting package.

Your first problem is defining "offenders", then "repeat offenders" and=20
"attackers".  Do you mean simply to track everyone who attempts to=20
connect to you?  I presume you don't expect much if any legitimate=20
incoming NEW traffic if this is the intent?

You might also want to look at http://ntop.org .  I've had it running on=20
my gateway for about a week now, and am delighted by the depth of detail=20
and the variety of views it offers.  Network load, protocol=20
distribution, etc are available along with per-IP information on=20
everyone who has connected, tracking when they've connected, what=20
protocols, bad packets, and much more.

j


