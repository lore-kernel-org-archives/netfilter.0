From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Strange ip_conntrack values
Date: Sun, 18 Jul 2004 11:46:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407181146.30331.Antony@Soft-Solutions.co.uk>
References: <ef83df6b040718033163810a15@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ef83df6b040718033163810a15@mail.gmail.com>
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

On Sunday 18 July 2004 11:31 am, John wrote:

> Hi,
>
> When I run the command
>
> grep ^tcp /proc/net/ip_conntrack | awk '{print $4}' | sort | uniq -c
>
> I get these lines ...
>
>     26 CLOSE
>     11 CLOSE_WAIT
>    883 ESTABLISHED
>     57 FIN_WAIT
>     34 SYN_RECV
>    116 SYN_SENT
>  23720 TIME_WAIT
>
> the TIME_WAIT number seems very strange ... network interrupts
> increased a lot three months ago and I couldn't find an explanation
> for this. The number of our visitors didn't increased like this ...

I agree this is strange, because the default TIME_WAIT timeout value is 2 
minutes (you haven't increased this, have you?), therefore this would suggest 
that nearly 24000 connections through your firewall were completed during the 
past two minutes...   This seems unlikely, especially in light of the number 
(883) you have in progress right now.

If you "grep TIME_WAIT /proc/net/ip_conntrack | more", do you see nearly all 
entries with the same source and/or destination address?   If so, investigate 
that machine.....

If not, I suggest a network sniffer (eg: ethereal) or some netfilter LOGging 
rules to see if you can identify what all this traffic is.

Regards,

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


