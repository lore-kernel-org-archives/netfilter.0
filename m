From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Prerouting question
Date: Tue, 6 Apr 2004 19:16:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404061916.39265.Antony@Soft-Solutions.co.uk>
References: <000801c41c01$01e18b40$0464a8c0@stu>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c41c01$01e18b40$0464a8c0@stu>
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

On Tuesday 06 April 2004 7:00 pm, Stuart Lamble wrote:

> Hi All
>
> If prerouting is the first rule a packet touches when arriving at the
> firewall, why then do we not set the default to DROP here and allow
> through what we need.

<Pedantic response>
Because PREROUTING is a nat table, and nat tables are for Network Address 
Translation.   FORWARD and INPUT are filter tables (the default if you don't 
specify in iptables rules), and that's where filtering operations such as 
DROP, REJECT, ACCEPT should be done.
</Pedant>

<Pragmatic response>
Because all sorts of things will go wrong if you try this.
</Pragmatist>

<Conntrack response>
Because all traffic passing through the interface has to go through the 
PREROUTING table, and this is where lots of connection tracking magic happens 
in the background, meaning that you (read: the rules in the PREROUTING table) 
don't see many of the packets going past, yet they still obey the default 
chain policy.   Therefore you can't catch all the packets you need to allow 
(they get handled behind the scenes), and you don't want to DROP any of the 
ones you can't see.
</Conntrack>

Regards,

Antony.

-- 
I'm pink, therefore I'm Spam.

                                                     Please reply to the list;
                                                           please don't CC me.


