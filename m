From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: deleting a conntrack record
Date: Thu, 17 Jun 2004 11:31:04 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <876ef97a040617083152c643b4@mail.gmail.com>
References: <876ef97a0406170807663b89e0@mail.gmail.com> <200406171620.24232.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406171620.24232.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thu, 17 Jun 2004 16:20:23 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> Why not just use the built-in timeouts to delete stale entries from the
> conntrack table?
> 
> You can adjust the timeout settings using entries in
> /proc/sys/net/ipv4/netfilter and I believe there may be a p-o-m update to
> give even further fine-grained control.

Because I only want to delete conntrack records for certain
connections, so timing out all TCP connections early is no good. As
well, I can't just do that alone also because other operations have to
be performed aside from deleting the conntrack record.
 
-- 
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

