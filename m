From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Yet another FTP connection problem
Date: Thu, 6 Jun 2002 11:32:17 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206061130590.16136-100000@wookie.shorewall.net>
References: <381341319.1023393093@[192.168.13.4]>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <381341319.1023393093@[192.168.13.4]>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik Pagel <erik.pagel@gmx.de>
Cc: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Thu, 6 Jun 2002, Erik Pagel wrote:

> Hi Tom,
> 
> > Some FTP sites use auth which can cause connection timeouts with that
> > ruleset. For safety, I recommend adding
> >
> > iptables -A INPUT -p tcp --dport 113 -j REJECT
> 
> Possible but I traced the connection with tcpdump and didn't see any 
> connection to port 113.
> 

My point was that if you use FTP long enough, you will see such connection 
requests from certain servers. Best to have the rule in place ahead of 
time than to wonder why you can't connect to ftp.anachronisms.com.

-Tom
-- 
Tom Eastep    \ Shorewall - iptables made easy
AIM: tmeastep  \ http://www.shorewall.net
ICQ: #60745924  \ teastep@shorewall.net


