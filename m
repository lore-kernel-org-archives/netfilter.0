From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall IP change
Date: Sat, 31 Jul 2004 14:50:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407311450.26258.Antony@Soft-Solutions.co.uk>
References: <40FEE340.8090907@ctwa.com> <200407261443.20581.Antony@Soft-Solutions.co.uk> <200407301522.01211.fred99@qualiflow.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407301522.01211.fred99@qualiflow.com>
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

On Friday 30 July 2004 2:22 pm, Fred wrote:

> Hi all,
>
> I've changed my external IP of my firewall (public IP now).
> I can access to the internet from my LAN but it's very very slow now.
> My bandwith looks good.

What exactly do you mean by that last statement?   I would have said that 
"very very slow" and "bandwidth looks good" mean almost opposite things.

> Have you got any idea ?

Where are your LAN machines getting their DNS from?
What are you using to test, and finding things "very very slow"?
Do you see the same speed problem if you download something to the firewall as 
downloading to an internal LAN machine?
Are you seeing lots of packets matching your DROP rules?
Have you tried a packet sniffer to see if there are unreplied packets on your 
LAN or external link?

Regards,

Antony.

-- 
"I estimate there's a world market for about five computers."

 - Thomas J Watson, Chairman of IBM

                                                     Please reply to the list;
                                                           please don't CC me.


