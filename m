From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Difficulties in stopping mass advertisement IP directed broadcast
  popup windows
Date: Fri, 05 Sep 2003 12:47:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F58BE37.6090601@chrisbrenton.org>
References: <88116A11E9DFD411870900508BEC3831803CB6@CPQ01>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Deshwal Chand <CDD@kampsax.co.in>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Deshwal Chand wrote:
> 
> We used to receive ip directed popup windows mass messages. I blocked 
> 135,137-39, 445 ports and they stopped. Now they have started to come again.

Check your Windoze boxes, you'll see they are listening on one or more 
ports in the TCP/1024 - TCP/1027 range as well. These ports can also be 
used to send pop-ups.

As a side note however, it sounds like you are trying to block what you 
are worried about and let everything else through, rather than only 
letting through what you need and blocking everything else. If you had 
taken the latter stance with your perimeter, this would be a mute issue 
as you would not have the ports open anyway.

Just my $.02,
C


