From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: newbie question
Date: Thu, 8 Apr 2004 13:02:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404081302.49038.Antony@Soft-Solutions.co.uk>
References: <004601c41d60$9bf1af70$aa47aacb@hacker>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004601c41d60$9bf1af70$aa47aacb@hacker>
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

On Thursday 08 April 2004 12:57 pm, M. Ahmad Ijaz wrote:

> when i try to use this command
>
> iptables -A PREROUTING -s xxx.xxx.xxx.xxx/yyy.yyy.yyy.yyy -p tcp -m tcp
> --dport 80 -j REDIRECT --to-ports 8080
>
> where xxx is any IP and yyy is the subnet mask, it returns me the same
> message i.e. iptables: No chain/target/match by that name
>
> So it also give the same message with POSTROUTING.

You need a "-t nat" in there, to tell it the rule is going into the nat table 
of the PREROUTING chain, not the filter table (which is the default, but does 
not exist in PREROUTING).

Regards,

Antony.

-- 
People who use Microsoft software should be certified.

                                                     Please reply to the list;
                                                           please don't CC me.


