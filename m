From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: x
Date: Sat, 27 Mar 2004 16:34:23 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403271634.23520.Antony@Soft-Solutions.co.uk>
References: <web-268947125@mail01.infosat.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-268947125@mail01.infosat.net>
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

On Saturday 27 March 2004 4:15 pm, IT Clown wrote:

> Hi all
>
> Im new to iptables when i configure iptables X server wont
> load i have the following in my iptables file:
>
> :INPUT DROP [0.0]
> :OUTPUT DROP [0.0]
> :FROWARD DROP [0.0]
>
> -A OUTPUT -p tcp -dport 0:80 -j ACCEPT

Please don't retype rules when posting to the list (I can tell from your typos 
that you have).   Copy and paste instead.   If we don't see *exactly* what is 
running on your machine, we can't offer accurate advice.

> Any idea why x server wont load?

Yes.   X needs to talk to itself over the loopback interface lo.

I suspect in fact that nothing which requires a network connection is going to 
work with the above ruleset (typos ignored), since you have no rule allowing 
replies in, for the packets which you do allow out....

I suggest you add some LOGging rules to your setup so that when things don't 
work, you can see what is trying to happen, and being blocked.

For example:

iptables -A OUTPUT -j LOG
iptables -A INPUT -j LOG

These will show you what sort of packets are trying to get out or in, just 
before they get DROPped by your default policy.

In order to solve the problem, I recommend allowing all packets to/from 
interface lo:

iptables -I INPUT -i lo -j ACCEPT
iptables -I OUTPUT -o lo -j ACCEPT

Regards,

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


