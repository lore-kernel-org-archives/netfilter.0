From: "Narendra Prabhu. B" <naren@deeproot.co.in>
Subject: Re: how to delete a piece of rule in iptables?
Date: Thu, 19 Dec 2002 10:55:33 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0212191050280.317-100000@abodh.pesit.deeproot.co.in>
References: <4165816408.20021218165236@complexsystem.ru>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4165816408.20021218165236@complexsystem.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "ITM CS Ruslan O. Nesterov" <ruslan@complexsystem.ru>
Cc: "netfilter @ lists . netfilter . org" <netfilter@lists.netfilter.org>


Hello,

There is a option --line-numbers, which can be used with -L in iptables.
Knowing the line/rule numbers ... u can later delete the specific rule.

Commands :

      #iptables -nL --line-numbers ---> this will show you the rulenumbers

      #iptables -D <chain-name> <rule-number>

Bye,
Narendra.


In the middle of difficulty..... lies Opportunity. (Albert Einstein)
--------------------------------------------------------------------
Narendra Prabhu. B             Free Software at its product-ive best.
DeepRoot Linux                             http://www.deeproot.co.in
                ---- Server Appliances ----
             ---- Linux Support and Services ----
-------------------------------------------------------------------

On Wed, 18 Dec 2002, ITM CS Ruslan O. Nesterov wrote:

> Hello bobo,
>
> Wednesday, December 18, 2002, 3:30:18 PM, you wrote:
>
> b>              i have insert some rules to iptables firewall.now,i would
> b> like to delete it  .
> b> but i only know to use iptalbes -L to empty them.
> b> but it lead to delete all the rules in it.
> b> how to do ??
>
>
> Try to use
> iptables -D INPUT 1
> this will delete rule 1 in input chain
>
> --
> Best regards,
>  ITM                            mailto:ruslan@complexsystem.ru



