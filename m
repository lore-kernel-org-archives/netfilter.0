From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re: selective filter
Date: Thu, 4 Dec 2003 09:47:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312040947.24520.Antony@Soft-Solutions.co.uk>
References: <002a01c3ba31$9d1a82b0$0501a8ac@Rares>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002a01c3ba31$9d1a82b0$0501a8ac@Rares>
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

On Thursday 04 December 2003 6:41 am, Admin wrote:

> Yesterday I posted a message regarding a selective filter.
> I was asking for a hands on making a filter which will force only some
> users to use the squid proxy and some not.
> The message can be found in "netfilter digest, Vol 1 #1355" with the
> subject "selective filter".
> First of all I want to thank you to Antony Stone
> <Antony@Soft-Solutions.co.uk> that replyed me on the list with a very
> helpfull instruction.
> And, because his wish was not to reply directly to him, I came with a
> suplementary question related to that message:

Thank you - I'm glad the answer was helpful.

The reasons I say "Please reply to the list" on my postings are:

1. There may be other people better qualified to answer a follow-up question 
than I am.
2. I may be busy and not able to respond as quickly as someone else who knows 
the answer as well.
3. Other people with similar problems (now, or in the future) can see the 
follow-up postings, and thereby benefit from the question and the answer.

> After I do this:
>
> iptables -A FORWARD -s 192.168.1.21 -p tcp --dport 80 -j ACCEPT
> ....
> iptables -A FORWARD -p tcp --dport 80 -j REJECT
>
> this mean that all the rules aplies to the running configuration?
> I mean, if I restart the service iptables I will have to write those rules
> again?
> To save the rules and to make them load after a service restart I have to
> type "service iptables save"?
> If the answer to the questions above is negative, I want to know what can I
> do to REMOVE the rules?

This question actually falls into category 1 above - someone else knows the 
answer better than I do, so I shall ask them to reply to this please.

Your question is more distribution-specific than it is to do with netfilter / 
iptables itself, and the "service iptables save" command is not one I use.

The answer to your final question however is easy - to delete a rule, simply 
replace the -A or -I in the original rule (append or insert) with -D 
(delete):

iptables -D FORWARD -s 192.168.1.21 -p tcp --dport 80 -j ACCEPT
iptables -D FORWARD -p tcp --dport 80 -j REJECT

Regards,

Antony.

-- 
Having been asked for a reference for this man,
I can confirm that you will be very lucky indeed if you can get him to work 
for you.

                                                     Please reply to the list;
                                                           please don't CC me.


