From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: states and UDP
Date: Fri, 03 Mar 2006 09:44:13 -0500
Message-ID: <4408563D.2040605@SCampbell.net>
References: <E1FFBMv-0016UD-1H@alf1.lmb.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E1FFBMv-0016UD-1H@alf1.lmb.internal>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

T. Horsnell wrote:
> Am I right in thinking that the stateful capabilities
> of iptables (NEW/ESTABLISHED/RELATED etc) only apply to
> tcp connections? If not, how are these states defined for
> udp?
>
> iptables doesnt complain if I add a rule containing
> '-p udp -m state --state NEW'
>
> Thanks,
> Terry.
>
>   
any tracked connection can have state.   For instance, one could write a 
conneciton tracker for NFS over UDP mounts and use the state flag in 
firewall rules.  That's not a real example (to my knowledge), I'm just 
showing that the capability is there.


