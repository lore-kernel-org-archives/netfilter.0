From: Feizhou <feizhou@linuxmail.org>
Subject: Re: (no subject)
Date: Tue, 29 Jun 2004 22:05:36 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E17730.6010305@linuxmail.org>
References: <1B5A52EE434FEB48AA4803AD84BD3FC37945@goliath.tngnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1B5A52EE434FEB48AA4803AD84BD3FC37945@goliath.tngnet.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Gutery <rgutery@MentorITS.com>
Cc: netfilter@lists.netfilter.org

Richard Gutery wrote:
> Stop macro:
> $IPT -N LD
> $IPT -A LD -j LOG
> $IPT -A LD -j DROP
> 
> $STOP=LD (LD = Log and Drop)
> 
> $IPT = /sbin/iptables
> 
> I need to totally block all packets to and from this address 64.246.26.185. So BLOCK means BLOCK.
> 
> We OpenBSD users usually mean blocking as dropping the silly thing on the floor. No ifs, ands or buts. Just gone...
> 
> As for the limiting, I simply copied a rule that was already in a firestarter script. So if I need to change the rule, I would be more than willing. Am I to assume that this is a bad rule?
> 

You want to totally block but you also want to log and limitly at that?

