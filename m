From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Questions about the workings of iptables
Date: Mon, 26 Jul 2004 14:17:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407261417.33159.Antony@Soft-Solutions.co.uk>
References: <564DE4477544D411AD2C00508BDF0B6A21C4DABE@usahm018.exmi01.exch.eds.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <564DE4477544D411AD2C00508BDF0B6A21C4DABE@usahm018.exmi01.exch.eds.com>
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

On Monday 26 July 2004 1:51 pm, Small, Jim wrote:

> 1)  How extensive is IPTables stateful packet filtering?  Are the sequence
> numbers carefully scrutinized as part of the state check?

No.   AFAIK the connection tracking in netfilter checks only src+dst IP+port, 
nothing else.

> Is there a listing of everything the connection tracking modules do?

Netfilter source code is probably your best bet here.

> If connection tracking or stateful inspection does not include TCP sequence
> checking, is there a way to add it?

I do not know of a patch to provide this.   It would be in patch-o-matic if 
there is one.

> 2)  Can IPTables randomize initial TCP sequence numbers?

No.   Netfilter doesn't change the packets on their way past, except for:
 - NAT, which will change as little as necessary to achieve the required 
ersult (ie source port numbers don't get changed if it can be helped)
 - mangle rules which specifically change things in the headers

> If not, is there an add-on that can?

How about a Linux or BSD-based proxy server :) ?

You really want something which is going to generate its own sequence numbers 
to do this properly (and a proxy server would help with your first question 
above as well).

I know that's not really the answer you wanted, but I'm not aware of any way 
to do these with netfilter itself.

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


