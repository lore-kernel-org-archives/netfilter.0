From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: table traversal
Date: Fri, 28 Feb 2003 15:04:22 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0302281501430.28507@dns.toxicfilms.tv>
References: <168d4128a3.128a3168d4@student.uml.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <168d4128a3.128a3168d4@student.uml.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: William Olbrys <william_olbrys@student.uml.edu>
Cc: netfilter@lists.netfilter.org

> iptables -A FORWARD -s 10.1.2.3 -j ACCEPT
> iptables -A FORWARD -s 10.1.2.0/255.255.255.0 -j DROP
>
> Under this scenario a packet from 10.1.2.3 would fall under both rules.
> But would the packets be dropped or allowed to go through?
It will be allowed because ACCEPT/DROP are nonreturning rules and the
decision is final.
Note that there are returning targets, like: LOG, TOS, etc. After matching
these the traversal continues.

Regards,
Maciej

