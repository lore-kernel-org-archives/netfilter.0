From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Some subject
Date: Wed, 10 Sep 2003 13:43:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030910174340.GA24654@cannon.eng.us.uu.net>
References: <20030910170222.ACD1459AC9@pandora.onwave.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030910170222.ACD1459AC9@pandora.onwave.com.br>
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
Content-Transfer-Encoding: 7bit
To: Kilson Arruda <iptables@onwave.com.br>
Cc: netfilter@lists.netfilter.org

First of all the notation is:

-d, --destination [!] address[/mask]

and not:

[!] -d, --destination address[/mask]

Secondly, there is only one "-d" permitted in each rule. If you can bundle
the IP's with the mask you're fine otherwise you need to have multiple rules.

Ramin

On Wed, Sep 10, 2003 at 01:02:22PM -0300, Kilson Arruda wrote:

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
> 
> 

