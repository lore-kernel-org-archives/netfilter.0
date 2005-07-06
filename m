From: "curby ." <curby.public@gmail.com>
Subject: Re: Defeating NMAP Null scans (and Nessus scans).
Date: Wed, 6 Jul 2005 13:54:55 -0600
Message-ID: <5d2f37910507061254293f83de@mail.gmail.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>
	<Pine.LNX.4.61.0506221442160.25356@yvahk01.tjqt.qr>
	<Pine.LNX.4.60.0506221245590.21678@darkstar.sysinfo.com>
	<Pine.LNX.4.61.0506221845160.21055@yvahk01.tjqt.qr>
	<Pine.LNX.4.60.0506221519210.21678@darkstar.sysinfo.com>
	<Pine.LNX.4.61.0506231301530.26133@yvahk01.tjqt.qr>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0506231301530.26133@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

On 6/23/05, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
> Read closely. It uses -m random to switch between REJECT/DROP.
> Try that rulesets and then nmap yourself with "nmap -r localhost -p 1-250=
0".
> Count the time, and compare to a pure DROP based approach.
>   (iptables -F; iptables -P INPUT DROP; nothing more)

There's a good chance that TARPIT and not REJECT is the thing slowing
down scans.  You might want to check replacing TARPIT with
DROP/REJECT; I think you'll see nonTARPIT scans take the same amount
of time regardless of whether the firewall uses DROP or REJECT.  I
didn't test this though.

Here are some rules I've used when testing out ways to catch nmap
scans.  If anyone knows what the SYN,RST SYN,RST match is for, please
let me know.

# Xmas scan, caught nmap v3.00
$IPTABLES -t nat -A PREROUTING -p tcp --tcp-flags ALL FIN,URG,PSH -j
DROP || die 05 81

# Generic Xmas scan, haven't checked if nmap triggers this
$IPTABLES -t nat -A PREROUTING -p tcp --tcp-flags ALL ALL         -j
DROP || die 05 83

# Null scan, nmap v3.00 Null scan is caught by INVALID match above, so
this is commented out
#$IPTABLES -t nat -A PREROUTING -p tcp --tcp-flags ALL NONE        -j
DROP || die 05 85

# Misc scan - everyone tests for this, but what scan does it match?
$IPTABLES -t nat -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j
DROP || die 05 87

# FIN scan, nmap v3.0 sends ACK,FIN FIN
# SYN,FIN SYN,FIN does not match nmap
# FIN FIN gets false positives when using SSH TARPIT
$IPTABLES -t nat -A PREROUTING -p tcp --tcp-flags ACK,FIN FIN -m state
--state NEW -j DROP || die 05 89

