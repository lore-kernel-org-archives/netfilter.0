From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: MRTG and IPTABLES
Date: Thu, 8 Jan 2004 12:07:48 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401081207.48443.Antony@Soft-Solutions.co.uk>
References: <83055D4B014C9E478D2F04624B9E82CFD4D8@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <83055D4B014C9E478D2F04624B9E82CFD4D8@noveldc.novelgmt.mu>
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

On Thursday 08 January 2004 11:56 am, Gilles Yue wrote:

> Hi,
>
> 	I have opened port 161 in my firewall script.
>
> 	$IPTABLES -A INPUT -p udp -m udp --dport 161 -j ACCEPT
>
> 	However, POSRTOUTING SET TO DROP By default, is preventing MRTG
> from 	running properly. (I have tried setting POSTROUTING TO ACCEPT
> and MRTG 	works fine)
>
> 	$IPTABLES -t nat -P POSTROUTING DROP

That is a very bad idea.

The nat tables are for address translation, not for filtering.

The filter tables are for filtering - that's where you should be DROPping 
packets.

Set the policy on POSTROUTING back to ACCEPT, and by all means tell us if this 
causes you any problems.

Regards,

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

                                                     Please reply to the list;
                                                           please don't CC me.


