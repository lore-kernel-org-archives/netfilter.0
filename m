From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: error message
Date: Mon, 7 Jul 2003 08:48:44 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0192B3@wardrive.citadelcomputer.com.au>
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
To: Mark <markryan@cfl.rr.com>, netfilter@lists.netfilter.org

"I have no idea what the error means or how to solve the problem.  Any =
help=20
would be appreciated."

I think it means your trying to insert the rule way way way after the =
end rule that exists... ie. you have 10 rules and your trying to =
`iptables -I INSERT 1000`

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Mark [mailto:markryan@cfl.rr.com]
Sent: Monday, July 07, 2003 5:00 AM
To: netfilter@lists.netfilter.org
Subject: error message
=20

