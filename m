From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: allow range syntax - perplexed
Date: Tue, 15 Jun 2004 19:52:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406151952.48641.Antony@Soft-Solutions.co.uk>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
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

On Tuesday 15 June 2004 6:00 pm, Jonathan Villa wrote:

> To my understanding the following will allow any address in the x.x.x.0
> block access
>
> $IPTABLES -A INPUT -p tcp --dport 22 -s xxx.xxx.xx.0/24  -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 3306 -s xxx.xxx.xx.0/24  -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 80 -s xxx.xxx.xx.0/24 -j ACCEPT

I agree - the above rules should allow any IP within the xxx.xxx.xx.0/24 Class 
C range access the firewall on port 22, 80 or 3306.

> It of course is not working...

Huh?   Why "of course"?   Come to that, why isn't it working?   I use that 
sort of netmask notation all the time...

> my temporary solution : looping through 1-254

Ugh!

Show us the rest of your INPUT and OUTPUT ruleset, and tell us how you are 
testing the system (and where from).

The output from "iptables -L -nvx" would be useful, as it shows us the rules 
in the correct order, which interfaces they apply to, and the packet / byte 
counts so we can see how many times particular rules have been matched.

Feel free to munge IP addresses if you want to hide things from the list 
archives :)

Regards,

Antony.

-- 
People who use Microsoft software should be certified.

                                                     Please reply to the list;
                                                           please don't CC me.


