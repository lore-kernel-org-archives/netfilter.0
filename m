From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables and yahoo games
Date: Fri, 28 Nov 2003 09:53:38 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311280953.38352.Antony@Soft-Solutions.co.uk>
References: <F22386C3FEB012449238672E38ED61E70A8EEF@overlord.overturemedia.com> <200311280943.15855.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311280943.15855.Antony@Soft-Solutions.co.uk>
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
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>

On Friday 28 November 2003 9:43 am, Antony Stone wrote:

> On Friday 28 November 2003 6:43 am, Fritz Mesedilla wrote:
> > Greetings friends!
> > What are the rules to allow yahoo games in iptables?
>
> Don't know.
>
> What TCP/UDP etc ports do the games use?
>
> If you can tell me that, I can tell you what rules to use.

PS: Just in case you don't know, remember that you can find this out by 
putting a LOG rule at the end of your existing netfilter rules, trying to run 
the games, and see what sort of packets get LOGged - this then tells you what 
sort of packets you need to an insert an earlier rule ACCEPTing, and things 
should start working.

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


