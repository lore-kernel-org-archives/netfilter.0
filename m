From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: related to -z option
Date: Wed, 10 Mar 2004 18:55:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403101855.08655.Antony@Soft-Solutions.co.uk>
References: <BAY12-F12shalxyPyF10000278a@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY12-F12shalxyPyF10000278a@hotmail.com>
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

On Wednesday 10 March 2004 11:47 am, rohit persaie wrote:

> Dear All,
>
> There is one option in iptables .....-Z , used for  the  packet  and byte
> counters in all the chains.
>
> Please tell me the use of this option, with example.

# clear the packet counters to zero
iptables -Z

# wait for some traffic to go through the machine (eg: come back tomorrow)
sleep 86400

# look at the counters now to find out how much traffic has matched each rule
iptables -L -nvx

# Repeat as long as the information interests you

Regards,

Antony.

-- 
Programming is a Dark Art, and it will always be. The programmer is
fighting against the two most destructive forces in the universe:
entropy and human stupidity. They're not things you can always
overcome with a "methodology" or on a schedule.

 - Damian Conway, Perl God

                                                     Please reply to the list;
                                                           please don't CC me.


