From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: What is the limitation of iptables's limit option?
Date: Mon, 29 Sep 2003 08:39:22 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C378@wardrive.citadelcomputer.com.au>
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
To: Nauman Malik <naumanm@khi.wol.net.pk>, Wu Nick <chundawu@hotmail.com>, netfilter@lists.netfilter.org

You could possibly do it per IP if you combine the rules with the RECENT =
p-o-m patch... read the patch o matic help file on this RECENT patch and =
it'll give you what you want.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au


-----Original Message-----
From: Nauman Malik [mailto:naumanm@khi.wol.net.pk]
Sent: Saturday, 27 September 2003 10:34 PM
To: Wu Nick; netfilter@lists.netfilter.org
Subject: Re: What is the limitation of iptables's limit option?


One more question related to this.
Can we limit no. of icmp packets per IP address?
Or shall it limit total no. of ICMP packets from all the source IP's.


=20

