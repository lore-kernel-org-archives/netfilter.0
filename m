From: Reuven Kohanim <rkohanim@yahoo.com>
Subject: Allow station addresses to remain intact during masquerade
Date: Sun, 6 Apr 2003 03:36:23 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030406103623.40748.qmail@web20713.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hello,
I currently work with ipchains to setup NAT from my
private network to the internet. Before getting to the
MASQ line I had a few  forward rules for letting a few
stations to get to a server in my DMZ with their
original IP address intact (i.e. not NATted). I need
to do this to allow those stations to work the
X-protocol with the sever set in my DMZ.

I have tried to upgrade to iptables. No matter what I
have tried those stations go out with the NAT address.
After having studied the flow charts of how a packet
traverses the chains it seems to me that I am out of
luck and no matter what I do the packet will end up in
the nat table of iptables and therefore its address
will get masqueraded. Am I wrong? Can anyone tell me
how to aviod masquorading those few stations when
working with my server. The SNAT will not do since I
need to preserve their original address. 

If I am not in the correct place for asking this
question I would appreciate it if someone would point
me to the right forum.

Thanks,
Reuven



__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com

