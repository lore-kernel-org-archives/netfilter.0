From: Jason Opperisano <opie@817west.com>
Subject: Re: use of the limiting options
Date: Wed, 26 Jan 2005 11:17:27 -0500
Message-ID: <20050126161727.GA6583@bender.817west.com>
References: <Pine.LNX.4.53.0501251248340.24829@altaica>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.53.0501251248340.24829@altaica>
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

On Tue, Jan 25, 2005 at 12:54:54PM -0600, Tib wrote:
> 
> I'd like to use the --limit and --limit-burst options to protect my sshd
> from dictionary password attacks. Considering the userbase and activity
> level I'd say that something like this would suit me just fine.
> 
> --limit 6/hour
> --limit-burst 2
> 
> This would limit it to two connect/login attempts at first, and then one
> more every 10 minutes.. correct?
> 
> Would this be the proper command to use? I'm trying to just limit
> connections from the outside world, not from the local network, hence the
> address as a destination:
> 
> iptables -A INPUT --d 66.80.174.210 --dport 22   \
>    --limit 6/hour --limit-burst 2

that's a fantastic way to DoS yourself.  so after 8 idiots try to
connect to your SSH server--you're locked out from connecting yourself
for an hour...*brilliant*.

try some real security measures instead of snake oil:

- disable password auth on your SSHD and only allow public key auth

- filter access to your SSHD by source IP, if possible

- use some sort of VPN access (IPSec/OpenVPN/etc) to get to your SSHD,
  and only allow access that way.

-j

--
"Please do not offer my god a peanut"
        --The Simpsons

