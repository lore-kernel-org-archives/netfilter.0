From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how can i combine these 2 iprules
Date: Fri, 5 Mar 2004 20:24:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403052024.34953.Antony@Soft-Solutions.co.uk>
References: <3590.128.59.176.161.1078512825.squirrel@sojourn.dyndns.org> <20040305191716.DD886DBC@sterenborg.info> <3698.128.59.176.161.1078517044.squirrel@sojourn.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3698.128.59.176.161.1078517044.squirrel@sojourn.dyndns.org>
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

On Friday 05 March 2004 8:04 pm, Technical wrote:

> Ok I got that but i am confused about how true iptables' sequential
> execution of rules is.
>
> Say for example that my I ping this machine from a host other than
> cnnp1.com and cnnp2.com. The packet should be logged by >> > iptables -A
> mychain -j LOG --log-prefix "IPTABLES: "
>
> My question is should not the execution of the rest of the rules in
> RH-Firewall-1-INPUT not happen

Once a packet RETURNs from a user-defined chain, or gets to the end of a 
user-defined chain (as it will if it matches the LOG target - this target 
does not terminate processing), it continues to be processed through the rest 
of the rules in the built-in chain which called it.

The two rules which you posted in your question only LOGged the packets - did 
not ACCEPT or DROP them, therefore the version I suggested to you in my 
answer did exactly the same - LOG without ACCEPTing or DROPping.

If you want to ACCEPT or DROP the packets and thereby avoid further processing 
in the INPUT chain, do so at the end of the user-defined "mychain".

Antony.

-- 
If you can't find an Open Source solution for it, then it isn't a real 
problem.

                                                     Please reply to the list;
                                                           please don't CC me.


