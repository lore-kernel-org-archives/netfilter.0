From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: Total traffic
Date: Mon, 06 Oct 2003 01:37:07 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F8129B3.2020300@smgtec.com>
References: <693.1065356660@www48.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <693.1065356660@www48.gmx.net>
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
To: Mario Ohnewald <mario.Ohnewald@gmx.de>
Cc: netfilter@lists.netfilter.org

I just insert blank rules to mangle,pre & post.

Mario Ohnewald wrote:

>Hello!
>I am running the SuSI Firewall2, and i want to find out my total traffic,
>which i need for my traffic script.
>I have 2 questions about it:
>Will: iptables  -L -vnx | grep "state NEW,RELATED,ESTABLISHED" | grep
>"ACCEPT     all"
>
>Give me the toal traffic? If yes, why does iptraf log about twice as much
>traffic than my iptables??
>
>Should it not be the same, or am i looking at the wrong iptables line?
>
>
>Cheers, Mario
>
>  
>


