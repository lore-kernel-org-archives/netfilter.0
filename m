From: Andy Loukes <andy@navaho.co.uk>
Subject: RE: [despammed] -i and -o options for iptables FORWARD chain
Date: Fri, 2 Jan 2004 15:21:48 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0401021520440.4138@picea.navaho>
References: <7A3B4AA360FDEF448F3390421FC8D731012C6B04@coxhpexg.coxhp.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7A3B4AA360FDEF448F3390421FC8D731012C6B04@coxhpexg.coxhp.com>
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
To: bmcdowell@coxhealthplans.com
Cc: netfilter@lists.netfilter.org

On Fri, 2 Jan 2004 bmcdowell@coxhealthplans.com wrote:

> Actually, couldn't this be just a 2.6.x change? (I never saw the rules
> go by...)  I thought I saw a message go by earlier to that effect.  
> Something about the syntax and needing '--physdev' and '-i' both, or
> something?
> 
> I could search the archives, I guess, but instead I suggest Gonya give
> that a go.

No, the physdev stuff is for bridging. -i and -o work the same in 2.6 as 
2.4

-- 
Andy Loukes
http://www.navaho.co.uk				Complete Appliance Technology


