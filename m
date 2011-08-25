From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ssh session are hanging when firewall is restarted
Date: Thu, 25 Aug 2011 01:04:50 -0500
Message-ID: <4E55E602.6040905@riverviewtech.net>
References: <CA+f1OFoJ06_94U9EpGr=85TZFyuAAScG7a-E7qzs2GuXFaRy9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+f1OFoJ06_94U9EpGr=85TZFyuAAScG7a-E7qzs2GuXFaRy9Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 8/24/2011 08:42, Adishesh M wrote:
> what is the problem with this above rule. we used this rule to drop
> bad tcp packets. when firewall is restarted using "service iptables
> restart", ssh sessions are hanging.

I don't think there is any thing wrong with the rule at all.  I think 
the problem is how you are thinking about the connection.

You are looking for connections that are new to the connection tracking 
sub-system that do not have a SYN flag set.

An already established SSH connection will not need to send a SYN 
packet, but will still appear "new" to the connection tracking 
sub-system after you re-start the firewall.

So, IMHO, this behavior should be expected.

I'd sit down and think about how frequently this ""problem (such as it 
is) happens and if it has enough impact to cause me to want to re-design 
firewall rules to take it in to account.



Grant. . . .
