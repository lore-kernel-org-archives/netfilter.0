From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: port forwarding not working
Date: Thu, 15 Apr 2004 15:16:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404151516.34180.Antony@Soft-Solutions.co.uk>
References: <004601c422f1$9162a3c0$ce00a8c0@xppro1>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004601c422f1$9162a3c0$ce00a8c0@xppro1>
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

On Thursday 15 April 2004 2:57 pm, Nick Vazirianis wrote:

> I am having some trouble getting port forwarding within the attached
> script.
>
> I even tried adding the line
> $IPTABLES -A INPUT -i $EXT_IF -p tcp --dport 6881:6885 -j ACCEPT
> but i believe this only allows incoming into the firwall and not
> redirecting to another host

Correct.   INPUT rules are for packets terminating on the machine.   FORWARD 
rules are for packets going somewhere else.

The problem is that your FORWARD rules allowing traffic to the 
newly-translated address for the BitTorrent service are specifying a source 
*address* of 6881, 6882, 6883 etc.   No way will that work.

I'm not sure whether you meant to specify a source port (--sport) instead of 
an address, or whether it should be left out completely, and just use the 
destination port in the rule?

Regards,

Antony.

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


