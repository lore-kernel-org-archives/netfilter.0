From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: publishing 2 web server on one valid IP
Date: Tue, 30 Sep 2003 09:43:47 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C3BE@wardrive.citadelcomputer.com.au>
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
To: Afshin Lamei <linux_st@hotmail.com>, netfilter@lists.netfilter.org

Depending on your load on the webserver.. If a proxy of some sort is not =
possible and you have one grunty firewall that can handle string modules =
well enough, you can string match the virtual host.

I've tested this and it works even though there's a possibility that =
some packets may be small enough to be fragmented and the string match =
won't match it but so far it's been OK. I haven't tested it with a large =
site either.. so really depends if this is a small project or not.

I would not use string matching on a production machine where it's =
critical to get it working 110%...

I would rather tell the ISP to supply 2 IPs...

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: Afshin Lamei [mailto:linux_st@hotmail.com]
Sent: Monday, 29 September 2003 10:13 PM
To: netfilter@lists.netfilter.org
Subject: publishing 2 web server on one valid IP


hi
I have 2 web servers in my DMZ. when there was one, I used DNAT to =
publish=20
the single web server on port 80 of the external interface of my =
firewall.=20
now I don't know how to distinguish between the requests of 2 web =
servers,=20
because I have only one IP address available for the external interface.
Is there any solution using iptables, to know that which http request =
must=20
be DNAT to which web server?
regards,
afshin

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*.=20
http://join.msn.com/?page=3Dfeatures/featuredemail



