From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Mail server behind a firewall
Date: Mon, 21 Nov 2005 15:22:50 -0600
Message-ID: <200511211522.50244.rob0@gmx.co.uk>
References: <7834b9550511211310n25ec94f5q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7834b9550511211310n25ec94f5q@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Monday 2005-November-21 15:10, Fernando Martins wrote:
>  I have been looking for a solution for days and nights and I can't
> find any solution to my problem.
>  I have installed a Mail server behind a firewall , firewall I have
> configured very badly with iptables.

If you do not understand iptables, I recommend that you get a script 
such as Arno's, MonMotha's, or Shorewall. (These in no particular order 
of preference, although I suspect if I took the time to read the docs I 
would choose Shorewall.)

>  I want an exterior smtp server to be able to speak with mine
>  but it is failing.

What did you try? How did it fail? What are your iptables rules?  How 
did you expect to get help without covering the basics?

>  My configuration is: 

... not clear from that. I guess you have a firewall on a public IP and 
you want to DNAT that to an internal mail server. But that is a guess.

>  nervous break down is close

And at this rate it's getting closer! :) Unless you take my advice to 
try Shorewall or similar, perhaps ...
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

