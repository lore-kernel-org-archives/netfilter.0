From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Not forwarding?
Date: Sun, 28 Mar 2004 22:32:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403282232.06322.Antony@Soft-Solutions.co.uk>
References: <20040328155231.32b07799@darna.vectec.net> <200403282148.46815.Antony@Soft-Solutions.co.uk> <20040328171548.72cbcdd6@darna.vectec.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040328171548.72cbcdd6@darna.vectec.net>
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

On Sunday 28 March 2004 10:15 pm, Cody Harris wrote:

> On Sun, 28 Mar 2004 21:48:46 +0100, Antony Stone wrote:
>
> > 4. Sorry for the way my mailer has mangled your rules, however please
> > post the output from "iptables -L FORWARD -nvx" (the v is important as it
> > shows the interface data which is not in the standard listing output).
>
> I did that. Check the other thread. Unless you want me to repost.

No, seen it already.   Thanks.

> > 5. How are you testing the setup?
>
> I created 2 unique usernames. And tested both. I got a freiend to try both.
> Phoneyuser on the firewall and night on the box i wanted. night didn't work
> but phoneyuser logged in ok

This is netfilter.   We're talking OSI layer 3/4, not layer 7.

That means I don't need to know about usernames & passwords, I need to know 
about IP addresses, where's the client, where's the server, etc.

Regards,

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


