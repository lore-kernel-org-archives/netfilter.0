From: Zoilo <zoilo@xs4all.nl>
Subject: Re: iptables is giving me probs
Date: Thu, 3 Oct 2002 20:53:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <02100320534300.02373@Lms>
References: <003801c26b07$2eb25f20$68287bd5@p4226>
Reply-To: zoilo@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003801c26b07$2eb25f20$68287bd5@p4226>
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
To: Sarkis Gabriel <sarky@raycon.net>, netfilter@lists.netfilter.org

On Thursday 03 October 2002 20:03, Sarkis Gabriel wrote:
> Hi all
> Well i am new to this list, and i have been trying to fix this problem for
> a while but i dont know what is causing this problem in the first place. i
> installed RH 7.2 and when i wanted to use iptables it gave me this error :
> /lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o: init_module:
> Device or resource busy
> Hint: insmod errors can be caused by incorrect module parameters, including
> invalid IO or IRQ parameters
> /lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o: insmod
> /lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o failed
> /lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o: insmod
> ip_tables failed
> iptables v1.2.5: can't initialize iptables table `filter': iptables who?
> (do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
>
> well it is driving me crazy i didnt do anything it is like that with a
> fresh install even on 7.3
> and i upgraded to that version to see if it will fix it but nope no luck..

RH comes with ipchains enabled i.o. iptables; you must disable ipchains in 
order to load iptables.

See last months' list archives for further details.

-- 
Z.
------------------------------------------------------------
"If all you have is a hammer, everything looks like a nail."

