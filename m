From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: iptables with iplimit option
Date: Sun, 24 Aug 2003 20:34:25 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C181@wardrive.citadelcomputer.com.au>
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
To: Noname Noname <spphu@hotmail.com>, netfilter@lists.netfilter.org

Do you have a table/chain called REJECT? If not then you probably mean =
DROP

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
From: Noname Noname [mailto:spphu@hotmail.com]
Sent: Sunday, August 24, 2003 1:02 PM
To: netfilter@lists.netfilter.org
Subject: iptables with iplimit option


Hi all

i'm trying to use iptables with iplimit option, i'm getting the below=20
problem
can any one help what is the caused problem and how can I solve it?

[root@www root]# iptables -A INPUT -p tcp --syn --dport http -m iplimit=20
--iplimit-above 4 -j REJECT
iptables: No chain/target/match by that name

thanks in advanced

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*.=20
http://join.msn.com/?page=3Dfeatures/featuredemail



