From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problems with Portforwarding -- Loopback problems---
Date: Tue, 16 Mar 2004 16:37:39 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403161637.39934.Antony@Soft-Solutions.co.uk>
References: <405624A2.60906@imperium-noctem.de> <40562EC9.5050604@imperium-noctem.de> <405728D2.5010603@imperium-noctem.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <405728D2.5010603@imperium-noctem.de>
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

On Tuesday 16 March 2004 4:18 pm, Ronny Fauth wrote:

> I've found out what the Problem is, well i tried to connect to my other
> Computer  at my homenetwork via Inet, well it looks like this
>
> Test --> Router/Gateway ---> Inet --> Router/Gateway --> Test2
>
> and this isn't acceptet by my Gateway... connections from outside my
> network are redirected properly. Well, how cann i tell my Router/Gateway
> that it should accept Loopback's ?

What do you mean by "loopbacks"?

Give us some IP addresses on the above diagram, and explain exactly what you 
are trying to do (eg: client on IP address xxx connects to server on IP 
address yyy on TCP port zzz etc), and we might understand...

Regards,

Antony.

-- 
It is also possible that putting the birds in a laboratory setting 
inadvertently renders them relatively incompetent.

 - Daniel C Dennet

                                                     Please reply to the list;
                                                           please don't CC me.


