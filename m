From: "Cornu Nicolas" <n.cornu@ifrance.com>
Subject: Re: MSN Voice chat with Iptables
Date: Tue, 3 Jun 2003 04:48:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009601c3297a$93f9b3b0$0100a8c0@windows>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D8D@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

That mean i need to compile patch o matic and recompile the kernel with
patch ?
Do u have some tips, i am new to linux and like Hare Ram i want to use MSN
voice chat

NC

----- Original Message -----=20
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "hare ram" <hareram@sol.net.in>; <netfilter@lists.samba.org>
Sent: Tuesday, June 03, 2003 12:37 AM
Subject: RE: MSN Voice chat with Iptables


If I'm not wrong, I think MSN uses Net Meeting for chatting and if this is
correct, you need the patch-o-matic patch for H323 to allow incoming H323
calls.
The bad side to this is that it only supports 1 machine behind the firewall
because you have to DNAT to a specified machine to receive any outside
calls.. AFAIK, this is what I had to do for Net Meeting..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au



-----Original Message-----
From: hare ram [mailto:hareram@sol.net.in]
Sent: Tuesday, June 03, 2003 12:49 AM
To: netfilter@lists.samba.org
Subject: MSN Voice chat with Iptables


Hi all

Does any one have Good URL to work
MSN Voice chat with IPTABLES+NAT

thanks
hare



_____________________________________________________________________
Envie de discuter en "live" avec vos amis ? T=E9l=E9charger MSN Messenger
http://www.ifrance.com/_reloc/m la 1=E8re messagerie instantan=E9e de France

_____________________________________________________________________
Envie de discuter en "live" avec vos amis ? T=E9l=E9charger MSN Messenger
http://www.ifrance.com/_reloc/m la 1=E8re messagerie instantan=E9e de France


