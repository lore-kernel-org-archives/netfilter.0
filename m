From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: -i and -o options for iptables FORWARD chain
Date: Fri, 2 Jan 2004 13:08:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401021308.16360.Antony@Soft-Solutions.co.uk>
References: <009a01c3cff6$ee23bd90$a5bbd00c@issaquah>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009a01c3cff6$ee23bd90$a5bbd00c@issaquah>
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
To: netfilter@lists.netfilter.org

On Wednesday 31 December 2003 11:36 pm, Gongya Yu wrote:

> Hi, I just updated Linux kernel to 2.6.0 with iptables and ebtables
> enabled.
>
> But iptables ignores -i and -o options for FORWARD chain. Wheneneve I use
> something like -i eth0 or -o eth0, the rule is just ignored.
>
> Any suggestions ?

I am not a 2.6 expert by any means, so this is just a suggestion: did you 
recompile the userspace tools (iptables) to match the new kernel code 
(netfilter)?

Antony.

-- 
My New Year's resolution is not to make any resolutions I can't keep.

I'm wondering whether I've failed already.
                                                     Please reply to the list;
                                                           please don't CC me.


