From: gypsy <gypsy@iswest.com>
Subject: Re: Asking again: string match fails to find anything
Date: Tue, 20 Jul 2004 23:07:44 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FE0830.78BEC825@iswest.com>
References: <D5C9032B2B09C64EA2409D6214E91AC90511CF@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Jason Opperisano <Jopperisano@alphanumeric.com>, netfilter <netfilter@lists.netfilter.org>

Jason Opperisano wrote:
> 
> is it possible that a rule above your "-m string --string $STRING" is matching the data packets of the connection; i.e, a "-m state --state ESTABLISHED -j ACCEPT" rule?
> 
> -j
            |
No.  That   V "I" down there says not.
> iptables -I INPUT -m string --string $STRING -j LOG
            ^
            |
Gypsy

