From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Block Kazaa from the internal network
Date: Fri, 17 Oct 2003 13:09:36 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C50C@wardrive.citadelcomputer.com.au>
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
To: netfilter@lists.netfilter.org

> iptables -A FORWARD -p udp -d 0/0 --dport 1024:65535 -m=20
> string --string
> "KaZaA" -j DROP
How about just blocking all UDP and allow only those needed?? saves =
doing string matches on alot of ports..
I thought Kazaa used some TCP as well..



PS: Never seems to amaze me how many have Kazaa working and want to =
switch it off and then there's the other half who want Kazaa and can't =
get it working.... Beats me.. he he.. well actually I know why, =
but............



Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

