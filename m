From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: Source Port
Date: Wed, 16 Apr 2003 15:26:47 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030416072647.GB3806@floyd>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Apr 15, 2003 at 04:32:13PM +0530, Dharmendra.T spoke thusly:

>#iptables -A INPUT -s 192.168.1.0/24 -p tcp -d 0/0 --dport 23 -j ACCEPT

For this case, it doesn't matter because I doubt your telnet binary
will be using 1-1024 ports for the outgoing telnet session initiation.
It'll need to be setuid to make the bind() call I think (Unix systems).

>Any Comments? This could be a good practise?

For other services, yes it can be tied down further. IKE traffic is
for source (UDP 500) <-> destination (UDP 500). I vaguely remember NTP
also being tied down to port 123, but that might have been specific to
my configuration settings, or even my source package.

I think there was (?) a tunable setting in /proc which can determine
which outgoing port numbers should be used, and it'll recycle the
numbers by itself.

If you are unlucky enough to be using (puke :-) MS Exchange, and your
users require access remotely -- it requires full 1-65535 (or close
enough) filter rules to be left wide open, unless you tweak the registry
settings to limit the port ranges. It makes sense there.
-- 
"any nation that wants to control its borders can do so." 
		- Tommy Franks; Mexicans && Columbia Drug War ?

