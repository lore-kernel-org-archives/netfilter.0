From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: MSN Voice chat with Iptables
Date: Tue, 3 Jun 2003 08:37:51 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D8D@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: hare ram <hareram@sol.net.in>, netfilter@lists.samba.org

If I'm not wrong, I think MSN uses Net Meeting for chatting and if this =
is correct, you need the patch-o-matic patch for H323 to allow incoming =
H323 calls.
The bad side to this is that it only supports 1 machine behind the =
firewall because you have to DNAT to a specified machine to receive any =
outside calls.. AFAIK, this is what I had to do for Net Meeting..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

=20

-----Original Message-----
From: hare ram [mailto:hareram@sol.net.in]
Sent: Tuesday, June 03, 2003 12:49 AM
To: netfilter@lists.samba.org
Subject: MSN Voice chat with Iptables


Hi all

Does any one have Good URL to work=20
MSN Voice chat with IPTABLES+NAT

thanks
hare



