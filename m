From: Giovanni Cardone <g_cardone@libero.it>
Subject: Re: ip_conntrack_ftp doesn't work
Date: Tue, 25 Jun 2002 11:23:26 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020625112326.A255@rainbow>
References: <20020614194204.A232@rainbow> <20020624151606.07c61b2c.adam@vbfx.com> <20020624193028.RXJI295.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020624193028.RXJI295.mta03-svc.ntlworld.com@there>; from Antony@Soft-Solutions.co.uk on Mon, Jun 24, 2002 at 08:30:26PM +0100
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

> But the script is not doing any NAT, and the log entry shows valid addresses 
> for both source and destination, so I don't think an FTP NAT module is going 
> to help ?

You right. I'm not doing any kind of NAT because I do not need it :). I've only 
this machine with a single dial-up access to the outside. No LAN/other machine 
behind that one. Simply, I can't have a standard(read: *no* passive) FTP
session and I dunno why. Have you some suggestions?

Thanks

