From: "j davis" <davis_compz@hotmail.com>
Subject: Re: [NMLUG] System Safety.
Date: Tue, 09 Jul 2002 23:55:26 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <F159N68c098V4p7Jl3O0000be65@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


you said earlier that you only have apache and other stuff running for fun 
in the office. I say shut the services down. And if he can just blast 
through your updated firewall you need to get a newfirewall. Maybe put a 
linux
firewall behind the netopia and do nat twice. Also I hope you are using 
tcpwrappers. Iptables and firewalls can block ports and ips. Tcpwrappers
can block service accsess based on ips. So you could set it so only allow
your ip could connect to the web-server or inetd. Can you get a new block of 
IP's?
Let me help build you a IPtables firewall with Snort and Tcpwrappers. How
generic is your ruleset on the netopia? You need to be really specifc with 
your
ruleset considering you are being targetted. And upgrade that rh6.2 box.

random thoughts in no order,
jd
http://www.taproot.bz


>From: wes robbins <dw4pres@yahoo.com>
>To: j davis <davis_compz@hotmail.com>
>Subject: Re: [NMLUG] System Safety.
>Date: Tue, 9 Jul 2002 12:53:48 -0700 (PDT)
>MIME-Version: 1.0
>Received: from web13305.mail.yahoo.com ([216.136.175.41]) by 
>mc2-f14.law16.hotmail.com with Microsoft SMTPSVC(5.0.2195.4905); Tue, 9 Jul 
>2002 12:52:50 -0700
>Received: from [134.253.26.4] by web13305.mail.yahoo.com via HTTP; Tue, 09 
>Jul 2002 12:53:48 PDT
>Message-ID: <20020709195348.91779.qmail@web13305.mail.yahoo.com>
>In-Reply-To: <F267xTIPOJP1VSN6ywd0000b685@hotmail.com>
>Return-Path: dw4pres@yahoo.com
>X-OriginalArrivalTime: 09 Jul 2002 19:52:50.0967 (UTC) 
>FILETIME=[35162270:01C22782]
>
>The router was not set to passive.  I'll double check
>tonight.  but. it totally looks that that he can get
>around the default Mil. Zone on that router.  I would
>like to stop him there.
>
>=====
>
>
>__________________________________________________
>Do You Yahoo!?
>Sign up for SBC Yahoo! Dial - First Month Free
>http://sbc.yahoo.com


thanks,
jd

jd@taproot.bz
http://www.taproot.bz

_________________________________________________________________
Send and receive Hotmail on your mobile device: http://mobile.msn.com


