From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Not forwarding?
Date: Sun, 28 Mar 2004 22:09:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403282209.16455.Antony@Soft-Solutions.co.uk>
References: <20040328155231.32b07799@darna.vectec.net> <200403282148.46815.Antony@Soft-Solutions.co.uk> <20040328165948.66bef4ef@darna.vectec.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040328165948.66bef4ef@darna.vectec.net>
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

On Sunday 28 March 2004 9:59 pm, Cody Harris wrote:

> On Sun, 28 Mar 2004 21:48:46 Antony Stone wrote:
> >
> > 1. Is any other protocol being forwarded correctly?
>
> I'm only forwarding tcp, i don't know what the deal is with ICMP.

Yes, I meant any protocol like HTTP, SMTP, POP3....?

Another way of wording my question: "Is SSH failing where other things work, 
or is SSH failing the same as everything else?"

> > 2. What does "cat /proc/sys/net/ipv4/ip_forward" return?
>
> 1

That's good.

> > 3. What do you mean by "properly"?   Does ssh work at all?  Sometimes?  
> > From some machines?   Only for a certain time, then stops?   What?
>
> It logs into my firewall. We've tested that by creating "phoneyuser" on the
> firewall and logging in as that.

So what's the answer to question 5?

> > 4. Sorry for the way my mailer has mangled your rules, however please
> > post the output from "iptables -L FORWARD -nvx" (the v is important as it
> > shows the interface data which is not in the standard listing output).
> >
> > 5. How are you testing the setup?

Regards,

Antony.

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.


