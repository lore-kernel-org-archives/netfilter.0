From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Is this firewall good enough?
Date: Wed, 09 Jun 2004 18:03:26 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C6E06E.6030002@linuxmail.org>
References: <20040608091436.84113.qmail@web14712.mail.yahoo.com> <200406081623.15400.Antony@Soft-Solutions.co.uk> <40C61D59.1090505@linuxmail.org> <200406091048.04303.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406091048.04303.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> On Tuesday 08 June 2004 9:11 pm, Feizhou wrote:
> 
> 
>>>That rule allows packets *to* port 80 - I was asking how you deal with
>>>*reply* packets - the ones *from* port 80 on the remote server.
>>
>>iptables -A tcp_packets -p --sport 80 --dport 1024:65535 -j ACCEPT

whoops, that should be:

iptables -A tcp_packets -p --sport 80 --dport 1024:65535 ! --syn -j ACCEPT

:P
> 
> 
> That is not my idea of a secure firewall rule - you are allowing an external 
> scanner  / attacker to access the machine on any TCP port from 1024 to 65535, 
> simply by setting their source port to 80.
> 
> Sheesh - we might as well go back to stateless routers with access control 
> lists.

My problems could be related to hardware not being powerful enough. It 
does show though that there is a cost to stateful modules we have.

