From: Erik Pagel <erik.pagel@gmx.de>
Subject: Re: Yet another FTP connection problem
Date: Thu, 06 Jun 2002 19:51:33 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <381341319.1023393093@[192.168.13.4]>
References: <Pine.LNX.4.44.0206060953560.15592-100000@wookie.shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0206060953560.15592-100000@wookie.shorewall.net>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Eastep <teastep@shorewall.net>
Cc: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

Hi Tom,

> Some FTP sites use auth which can cause connection timeouts with that
> ruleset. For safety, I recommend adding
>
> iptables -A INPUT -p tcp --dport 113 -j REJECT

Possible but I traced the connection with tcpdump and didn't see any 
connection to port 113.


>
> -Tom
> --
> Tom Eastep    \ Shorewall - iptables made easy
> AIM: tmeastep  \ http://www.shorewall.net
> ICQ: #60745924  \ teastep@shorewall.net
>
>



