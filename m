From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Is this correct?
Date: Fri, 20 Jun 2003 13:37:18 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6F1B@wardrive.citadelcomputer.com.au>
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
To: Shawn <core@enodev.com>, Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

If it had a route then it would throw it if it had no DNAT rule, but you =
do so it'll translate the DEST IP to 192.168.0.1 before it dropped it. =
And if you had a route then you wouldn't require the "ip addr add" =
command either..

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
From: Shawn [mailto:core@enodev.com]
Sent: Friday, June 20, 2003 12:30 PM
To: Daniel Chemko
Cc: netfilter@lists.netfilter.org
Subject: RE: Is this correct?


It wouldn't throw it away if it had a route for it, would it?

Since linux-router/eth1 has 10.0.0.250/24 assigned, wouldn't it forward
out that one?

