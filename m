From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: (no subject)
Date: Wed, 10 Sep 2003 14:53:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309101453.22145.Alistair@nerdnet.ca>
References: <20030910170222.ACD1459AC9@pandora.onwave.com.br>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030910170222.ACD1459AC9@pandora.onwave.com.br>
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
To: Kilson Arruda <iptables@onwave.com.br>, netfilter@lists.netfilter.org

On September 10, 2003 12:02 pm, Kilson Arruda wrote:

	See Ramin Dousti's correction to your notation.
	
	next point -- exclusions require a separate user chain to stack 
	exclusions.

	Create new chain, send all packets destined for the redirection port to 	
	this chain, 
	then in this chain, RETURN the packets you DONT want redirected, and
	at the end of this chain, redirect everything.... 

	you can't stack exclusions since the first exclusion will grab the targets
	of all successor exclusions.


> I have a Transparent Proxy like this
>
> $IPTABLES -t nat -A PREROUTING -p tcp
> --dport 80 ! -d $DIRECT_IP -m mac --mac-source $MAC -j REDIRECT --to-port
> 3128
>
> Question: can I use more then one "! -d", or multiple IPs to don't REDIRECT
> the port 80 for more then one IP?
> If yes, how can I do this?
>
> --
> Kilson Arruda
> Linux User # 228238
>
>
>
> ________________________________________________
> www.onwave.com.br - Internet e Conectividade

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

