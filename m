From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is "no route to host" fake possible?
Date: Fri, 25 Jun 2004 10:15:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406251015.25940.Antony@Soft-Solutions.co.uk>
References: <20040625085336.GA1094@xy1.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040625085336.GA1094@xy1.org>
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

On Friday 25 June 2004 9:53 am, iptables-ml@xy1.org wrote:

> Hello,
>
> I know the rules REJECT, DENY or DROP, but is it possible to return to
> the client the error message "no route to host" ?

iptables -A FORWARD etc -j REJECT --reject-with icmp-host-unreachable

If that's not the icmp error message you meant, try "man iptables" and look at 
the REJECT target for more ideas.

Regards,

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


