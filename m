From: Axel Heinrici <heinrici76@gmx.de>
Subject: Re: anti-dos
Date: Wed, 28 Jan 2004 11:08:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401281108.04514.heinrici76@gmx.de>
References: <F22386C3FEB012449238672E38ED61E71642B1@overlord.overturemedia.com> <1075277664.7228.56.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075277664.7228.56.camel@raylinux.internal>
Content-Disposition: inline
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

Hi

On Wednesday 28 January 2004 09:14, Ray Leach wrote:
>
> You can use the limit support to limit packet rates:
>
> ### syn-flood chain
> $IPTABLES -N syn-flood
> $IPTABLES -A syn-flood -i $IFACE_INET -m limit --limit 75/s
> --limit-burst 100 -j RETURN
> $IPTABLES -A syn-flood -i $IFACE_DMZ -m limit --limit 75/s
> --limit-burst 100 -j RETURN
> $IPTABLES -A syn-flood -i $IFACE_INT -j RETURN
> $IPTABLES -A syn-flood -j LOG --log-prefix "SYN-FLOOD: "
> $IPTABLES -A syn-flood -j DROP
>
> $IPTABLES -A INPUT -i $IFACE_INT -p tcp --syn -j syn-flood
> $IPTABLES -A INPUT -i $IFACE_DMZ -p tcp --syn -j syn-flood
> $IPTABLES -A INPUT -i $IFACE_INET -p tcp --syn -j syn-flood
>
I have a questions on this. As I interpret the rules any packet with is 
not catched by the two limit-rules is targeted to LOG. 
Due to the huge number of possible SYN-Packets in a dos-attack this does 
not seem useful to me. Shouldn't there be a "-m --limit 
10/minute" in the log-rule?

with kind regards
	Axel


