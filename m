From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables question.
Date: Tue, 17 Feb 2004 16:40:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402171640.36033.Antony@Soft-Solutions.co.uk>
References: <403238d7.275c.0@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <403238d7.275c.0@arbbs.net>
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

On Tuesday 17 February 2004 3:52 pm, John Black wrote:

> I'm trying to install a gateway/router with Red Hat 9 kernel 2.4.24 and the
> stock iptables 1.2.7, with full NAT compiled into the kernel.

Is this a standard RH combination - you've just installed some RPMs etc, or 
have you built some part of it yourself (in which case the problem may well 
be that you didn't buid the ither part as well)?

"netfilter" is the kernel part of the code, and "iptables" is the user part.   
Both must match (be the same version) on a system in order to work correctly.

> I have read
> the howto at netfilter.org, even have the same line of code.  But it sill
> will not change the source address.
>
> here is the line of code and the result of the command
> iptables -t nat -L -n
>
> iptables -t nat -A POSTROUTING  -o eth0 -j SNAT --to Ext_ip
> target prot opt source     destination
> SNAT   all  --  0.0.0.0/0  0.0.0.0/0   to:Ext_ip

A better command would be "iptables -L -nvx" because the v option tells us 
which interfaces the rule applies to, and in this case that's important.

By the way, how are you testing the rule and coming to the conclusion that the 
source address is not being changed?

Regards,

Antony.

-- 
Your work is both good and original.  Unfortunately the parts that are good 
aren't original, and the parts that are original aren't good.

 - Samuel Johnson

                                                     Please reply to the list;
                                                           please don't CC me.


