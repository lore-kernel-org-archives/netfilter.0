From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: pptp patch
Date: Thu, 19 Jun 2003 09:18:41 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006101c3367e$734644b0$1001a8c0@s3ac>
References: <84874F5F45111E48B53F4A3314BC4F3C389674@mail.columbuscontainer.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <84874F5F45111E48B53F4A3314BC4F3C389674@mail.columbuscontainer.com>
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
To: "'Hill, John'" <jhill@columbuscontainer.com>, netfilter@lists.netfilter.org


> 
> I have kernel 2.4.21 netfilter - latest cvs.
> 
> Built netfilter for extra added pptp support.
> 
> Recompiled kernel -- netfilter.
> 
> I have a win2000 pptp server behind a Linux firewall

Well having gone yrou route here is my 2 cents. 

A.) if your not married to pptp then setup a freeswan vpn on your
firewall  freeswan accepts connection from pretty much any other vpn
including windows2000. sorry pptp not included. I think it's generally
accepted that pptp is out the door.

B.) if you are married to pptp wait until a stable version has been
released with netfilter. It's not wise to play with beta/experimental
software on sensitive information.   To the best of my knowledge pptp
can nly handle one connection at a time with the current patch. This is
per the netfilter website.


> 
> I had 3 VPN connections working. When one closed the 
> connection the kernel panicked and died. I could not recover 
> the error message. I was forced to power off.


