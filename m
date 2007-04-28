From: Kirk Wallace <kwallace@wallacecompany.com>
Subject: [Fwd: Re: Wireless Login Page]
Date: Sat, 28 Apr 2007 08:03:40 -0700
Message-ID: <1177772620.3828.176.camel@ws1.walco02.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-k5ncLBCssWRLeVHFAizc"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


--=-k5ncLBCssWRLeVHFAizc
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

(This may be a duplicate message, KW)

Thank you for the replies Alex and Jan.

I set up a test system with two PC's. PC one has Apache httpd running on
it with iptables flushed, defaults set to accept all packets and is at
192.168.21.1 . PC two is simply a workstation at 192.168.21.10 . I can
get my default webpage by pointing the workstation's browser to
192.168.21.1 . I invoked "iptables -t nat -A PREROUTING -p TCP --dport
80 -j REDIRECT" on the http host. At this point I was expecting to point
the workstation's browser to 192.168.21.2 and get the default webpage,
but this returned "Unable to Connect".

It seems from the description of REDIRECT 
( http://www.faqs.org/docs/iptables/targets.html#REDIRECTTARGET ) that,
when the packet hits the PREROUTING table, it immediately gets sent to
localhost and presumably httpd. I am guessing here, but since httpd is
an application, the tcp/ip stuff gets stripped off (but the port number
stays?), so the fault must be in how Apache is set up? I am thinking,
did Apache receive the packet (maybe check the appropriate log file?).
Did Apache have a problem interpreting the packet it received (check
logs)? Or, may this be a situation where the server can't figure out
where to send a reply?

Thank you for any replies.

Kirk
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--=-k5ncLBCssWRLeVHFAizc
Content-Disposition: inline
Content-Description: Forwarded message - Re: Wireless Login Page
Content-Type: message/rfc822

Return-Path: <root@pop.webq.de>
Received: from pop.webq.de (fra.shoplogistics.de [195.52.221.74]) by
	sonnet1.sonnet.com (8.13.1/8.12.5) with ESMTP id l3RHRnlQ099116 for
	<kwallace@wallacecompany.com>; Fri, 27 Apr 2007 10:27:54 -0700 (PDT)
	(envelope-from root@pop.webq.de)
Received: by pop.webq.de (Postfix, from userid 0) id 6DE5221B40; Fri, 27
	Apr 2007 19:27:40 +0200 (CEST)
Received: from vishnu.netfilter.org (vishnu.netfilter.org [213.95.27.115])
	by pop.webq.de (Postfix) with ESMTP id 458AF23168 for
	<m.graf@shoplogistics.de>; Fri, 27 Apr 2007 13:42:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=vishnu.netfilter.org) by
	vishnu.netfilter.org with esmtp (Exim 4.62 #1 (Debian)) id
	1HhPlY-00023v-Nb; Fri, 27 Apr 2007 14:41:37 +0200
Received: from xeentech.com ([207.150.165.140] helo=fram.cjb.net) by
	vishnu.netfilter.org with esmtp (Exim 4.62 #1 (Debian)) id
	1HhPkS-0001iY-Dt
	for <netfilter@lists.netfilter.org>; Fri, 27 Apr 2007 14:40:29 +0200
Received: from rhea (unknown [10.8.0.10]) by fram.cjb.net (Postfix) with
	SMTP id BEFB0146288; Fri, 27 Apr 2007 11:40:58 +0000 (UTC)
Message-ID: <00d501c788c0$f460c730$0a00080a@rhea>
From: "Alex" <alex@hackgod.org>
To: "Kirk Wallace" <kwallace@wallacecompany.com>,
	<netfilter@lists.netfilter.org>
References: <1177606092.3828.108.camel@ws1.walco02.com>
Date: Fri, 27 Apr 2007 12:41:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3028
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
X-Spam-Score: -2.5 (--)
Cc: 
Subject: Re: Wireless Login Page
X-BeenThere: netfilter@lists.netfilter.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: General discussion and user questions <netfilter.lists.netfilter.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
X-Bogosity: Unsure, tests=bogofilter, spamicity=0.499843, version=0.14.4
X-UIDL: GdI!!Me$#!n(7!!mD+"!
Content-Transfer-Encoding: 7bit

You don't need contrack for the redirection part. I've achived the same 
thing on my router using -j REDIRECT

You could do it for only port 80 trafic, but I've done it for all traffic. 
You get some entertaining attempts from people trying to work out why they 
have a valid DHCP lease but now internet conductivity.

----- Original Message ----- 
From: "Kirk Wallace" <kwallace@wallacecompany.com>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, April 26, 2007 5:48 PM
Subject: Wireless Login Page


>I have a wireless card installed on Fedora 4 system. I have the wireless
> connection open, DHCP enabled and have disabled forwarding for the
> "open" network. I use Poptop and Radius to authenticate and assign IP
> addresses on the tunnel and then allow forwarding for the tunnel address
> range. I now want to have all http requests from the "open" network to
> be directed to a opening/login page on the wireless server. Can this be
> done with iptables (conntrack?)? Would anyone suggest links or keywords
> for finding more information? Thank you.
>
> Kirk
>
>
> 




--=-k5ncLBCssWRLeVHFAizc--


