From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: Benchmark
Date: Tue, 13 Jul 2004 15:17:47 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040713151747.5af1ef20@mgalepc.utilitran.com>
References: <1089752682.6507.7.camel@aflores>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089752682.6507.7.camel@aflores>
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

Hello,

	Well I am not expert but I think that user chains could improve performance. If you had in total 1000 rules and no user
chains, a packet may have to go through 999 rules to find a match or no match. If you broke up your 1000 rules into 25
different user chains a packet would at most have to be matched against 24 user chains and then only be checked against
required chains and not other rules.

Michael.


On Tue, 13 Jul 2004 18:04:43 -0300
Alejandro Flores <alejandro.flores@triforsec.com.br> wrote:

> 	Hello there,
> 
> 	Well, I've been teaching netfilter/iptables for a while, and always
> there's someone asking about performance. Normally, they use other kind
> of firewall, like cisco pix or checkpoint. Is there any benchmark out
> there?
> 	Another point is, how much user-chains can degrade the performance?
> IMHO, user chains are simple the best to help you organize and separate
> rules in groups. But, how can I measure if it's degrading the
> performance?
> 
> Thanks!
> Alejandro
> 
> Ps. Sorry my poor english!
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

