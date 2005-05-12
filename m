From: varun_saa@vsnl.net
Subject: Re: mails not going thru'
Date: Thu, 12 May 2005 16:50:28 +0500
Message-ID: <13c5f5713c2d67.13c2d6713c5f57@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org



----- Original Message -----
From: Jason Opperisano <opie@817west.com>
Date: Monday, May 9, 2005 8:04 pm
Subject: Re: mails not going thru'

> On Mon, May 09, 2005 at 08:53:33AM +0500, varun_saa@vsnl.net wrote:
> > [varun@saamail varun]$ telnet 64.233.185.27 25
> > Trying 64.233.185.27...
> > 
> > No response
> 
> try that from the firewall itself.  if it still doesn't work, i would
> propose that your ISP blocks TCP port 25 traffic from customer IP's 
> fromleaving it's network (mindspring used to do this, dunno if 
> earthlinkcontinued the trend as i dropped them after they refused 
> to rethink
> their policy).
> 
> -j
> 
From the server

root@saaserver root]#  telnet 64.233.185.27 25
Trying 64.233.185.27...
Connected to 64.233.185.27.
Escape character is '^]'.
220 mx.gmail.com ESMTP 6si352981wrl
quit
221 2.0.0 mx.gmail.com closing connection
Connection closed by foreign host.

Sorry for the delay in replying.
Just got stuck with other issues.


Varun


