From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: bandwidth again maybe O T
Date: Mon, 9 Sep 2002 09:59:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020909085945.JAQ24905.mta01-svc.ntlworld.com@there>
References: <FLEKIPPLAEDMJMOOBBDPGEKBCNAA.stewart.thompson@shaw.ca> <200209091158.11787@.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209091158.11787@.>
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

On Monday 09 September 2002 7:31 am, PayalR wrote:

> Hi,
> 	Thanks a lot for the mails. I am late to reply cos' my connection was down
> for 4 days.
> Well, I put the rules like
> ptables -I FORWARD -d 192.168.0.1 -p tcp
> iptables -I FORWARD -s 192.168.0.1 -p tcp
>
> Yes, I can see the logs by,
> iptables -v -L
> But there is nothing in FORWARD chain. The input and output chains are
> filled up.
> What is the problem?

Are you trying to count packets going in & out of the firewall machine, or 
are you trying to count packets going through the firewall between two other 
machines ?

eg if you ping the firewall itself from some client, you will see packets 
comin the INPUT chain, and replies go out the OUTPUT chain.   This will not 
generate any FORWARD packets at all.

if you ping machine A on one side of your firewall from machine B on the 
other side of your firewall (neither A nor B actually is your firewall) then 
you will see packets in the FORWARD chain but nothing in the INPUT or OUTPUT 
chains.

Does this clarify things ?

Antony.

-- 

There are two possible outcomes.

If the result confirms the hypothesis, then you've made a measurement.
If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

