From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Statefull??
Date: Sun, 4 Apr 2004 13:45:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404041345.16938.Antony@Soft-Solutions.co.uk>
References: <4070CB3E.3000603@scan-associates.net> <200404041228.25943.Antony@Soft-Solutions.co.uk> <4070E0B8.2050706@scan-associates.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4070E0B8.2050706@scan-associates.net>
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

On Monday 05 April 2004 5:29 am, Wan Seman Bin Wan Ismail wrote:

> Antony Stone wrote:
> | Because you are REJECTing the reply packets from the server :)
> |
>
> i still can't figure out, if i modified the rule then add this entry,
> ppl on my web (got shell access) can go anywhere.
>
> $ipt -A SCAN -i $DMZ -o $EXT -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN
> - -m state --state NEW  -j REJECT
>
> That's not what i want, what i need is my web server can serve ppl from
> outside but fw denied any new connections from the web server to
> outside.

I suggest you add a rule allowing ESTABLISHED,RELATED (but not NEW) packets 
from the DMZ to EXT.   That will allow replies but no new connections.

However, I also suggest you think very carefully about not allowing NEW 
connections from your web server to the outside world - specifically in 
relation to DNS - are you sure the web server itself never needs to do 
external lookups (perhaps for visitor logs etc)?   So long as this is true, 
you'll be okay, but I think you should keep an eye on your netfilter log 
entries to see if the web server is trying to make some external connections 
which you actually decide you want to allow.

Regards,

Antony.

-- 
If you can't find an Open Source solution for it, then it isn't a real 
problem.

                                                     Please reply to the list;
                                                           please don't CC me.


