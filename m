From: Alex Satrapa <alex@lintelsys.com.au>
Subject: Re: could someone translate these rules inot plain english
Date: Fri, 23 Jan 2004 08:40:40 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40104358.2050908@lintelsys.com.au>
References: <33682.66.65.52.125.1074751856.squirrel@sojourn.dyndns.org>      <400F6EF4.2060608@lintelsys.com.au> <34137.66.65.52.125.1074768489.squirrel@sojourn.dyndns.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <34137.66.65.52.125.1074768489.squirrel@sojourn.dyndns.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Technical wrote:
> If the default is that iptables to reject all packets that cannot not be
> deall with any of the previous rules, why would somemone use the last
> rule??  am I missing something??

It explicitly tells the remote computer that they're not *allowed* to 
communicate with that host - as opposed to just dropping the packets 
(pretending you're a black hole), or rejecting the packets with "host 
unreachable" or "port unreachable".  These two options imply that the 
remote host is *allowed* to try connecting, but there's just nothing there.

The administrator at the other end would likely act different ways in 
these circumstances. Upon noticing that there are many "host 
unreachable" messages coming through, the administrator would take the, 
"leave it alone and try again" stance - since the assumption would be 
that something is broken. "host prohibited" messages explicitly state to 
the administrator that everything is working just as it should be, and 
that communication with that host is simply not allowed.



