From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: REDIRECT question
Date: Mon, 14 Jul 2003 07:55:38 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0192B8@wardrive.citadelcomputer.com.au>
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
To: Ruslan Spivak <alienoid@is.lg.ua>, netfilter@lists.netfilter.org

PREROUTING only works for real packets being received from the network =
and not locally generated packets (localhost). So with localhost, the =
packets do not leave the wire and come back for PREROUTING to work, I =
think only INPUT/FORWARD/OUTPUT will receive these localhost packets.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: Ruslan Spivak [mailto:alienoid@is.lg.ua]
Sent: Friday, July 11, 2003 9:09 PM
To: netfilter@lists.netfilter.org
Subject: REDIRECT question


Hello!

Can you help me with the following:

i try to make REDIRECT on my local host -

$IPTABLES -t nat -N REDIRECT_CHAIN
$IPTABLES -t nat -A REDIRECT_CHAIN -p tcp --dport 80 -j REDIRECT=20
--to-port 7080
$IPTABLES -t nat -A PREROUTING -j REDIRECT_CHAIN

When users in my LAN connect to my host's 80 port they are redirected to =

7080 - it's ok. But when i try to do on my host - telnet localhost 80 -=20
i get connection refused (looks like redirection doesn't work). What=20
maybe the problem?

Best regards,
Ruslan




