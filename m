From: Jason Opperisano <opie@817west.com>
Subject: Re: masqued AND forwarded
Date: Thu, 27 Jan 2005 09:24:30 -0500
Message-ID: <1106835870.5784.21.camel@hubcap.ljm.dom>
References: <018b01c50451$c87378c0$0200a8c0@etpi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <018b01c50451$c87378c0$0200a8c0@etpi>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2005-01-27 at 04:22, TestMail wrote:
> Try this one :
> 
> modprobe ip_conntrack_ftp
> modprobe ip_nat_ftp
> 
>  iptables -t nat -A PREROUTING -i $EXT_IF -p tcp -d $PUBLICIPADD \
>    --dport 21 -j DNAT --to-destination $LOCALADDOFFTP

yes.

>  iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d $LOCALADDOFFTP
>  \ --dport 21 -j ACCEPT

yes.

> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT  # This is
> the stateful inspection command.

bzzzzzzzt.  how about:

  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

-j

--
"Well, I'm tired of being a wannabe league bowler. I wanna be a
 league bowler!"
	--The Simpsons


