From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: using iptables to route between public networks
Date: Tue, 23 Dec 2003 15:42:48 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312231542.48587.Antony@Soft-Solutions.co.uk>
References: <001301c3c96a$060086c0$0100a8c0@KARI>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001301c3c96a$060086c0$0100a8c0@KARI>
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

On Tuesday 23 December 2003 3:32 pm, Matthew Simpson wrote:

> I must have been doing something stupid last night, because I retried it
> this morning and it works.  Here is what I have for the forward chain:
>
> $IPTABLES -A FORWARD -d 209.210.10.1/28 -j ACCEPT
> $IPTABLES -A FORWARD -d ! 209.210.10.1/28 -j DROP
> $IPTABLES -P FORWARD ACCEPT
> $IPTABLES -F FORWARD
>
> This works.

When you say "this works", is assume that's only for minimal values of 
"working" :)

I can't believe that a router which will drop all packets except those 
addressed to 209.210.10.0/28 (note that your address designation is slightly 
incorrect above) will do an effective job.

You may want to route inbound packets only to these IP addresses, but what 
about the replies?   They are going to be going to other destination 
addresses, and need routing too.....

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


