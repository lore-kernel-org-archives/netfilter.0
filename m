From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: iptables -L *very* slow
Date: Mon, 17 Feb 2003 07:30:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030217073050.225bd7e9.arnt@c2i.net>
References: <3E5074CF.90904@mega-bucks.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E5074CF.90904@mega-bucks.co.jp>
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

On Mon, 17 Feb 2003 14:36:15 +0900, 
Jean-Christian Imbeault <jc@mega-bucks.co.jp> wrote in message 
<3E5074CF.90904@mega-bucks.co.jp>:

> When I try and print out my iptable rules using iptables -L, it takes 
> about three minutes for the rules to print out (and there are only 9
> of them).
> 
> Why is does this take so long? Is this a bug?

..no, a feature, it shows you you have bad resolving too.

..compare with 'iptables -nL'.  ;-)
 
> I am using the newest version of iptables with a custom 2.4.20 kernel.
> 
> Thanks!
> 
> jc
> 
> 


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



