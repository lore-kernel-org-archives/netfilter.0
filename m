From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Port FWD via 2 NAT
Date: Thu, 22 May 2003 21:04:24 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CAD@wardrive.citadelcomputer.com.au>
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
To: Adi <adi@nettek.pl>, "netfilter@lists.netfilter.org"@sec.artur.pl
Cc: netfilter@lists.netfilter.org

Ok, firstly you don't need to use SNAT as MASQUERADE will do the same =
job.
Also, do you telnet from both linux machines to other other side (both =
sides telnet each other), if not then you don't need --dport 23 on =
linux1.

Don't need to specify the ":23" after the IP you've SNATted to.. it uses =
that anyway.

Where does the public address come into the Linux2 machine as all I see =
is 10.0.2.2 , I assume that's the example public address? If not then =
what kind of network setup is this?

What other rules have you got there? Are the defaults for FORWARD are =
ACCEPTed? are you logging anything? You should..

-----Original Message-----
From: Adi [mailto:adi@nettek.pl]
Sent: Thursday, May 22, 2003 7:47 PM
To: George Vieira; Adi; "netfilter@lists.netfilter.org"@sec.artur.pl
Cc: netfilter@lists.netfilter.org
Subject: RE: Port FWD via 2 NAT


> Err... did you label your picture right according to what you said??
> POSTROUTING should be done on linux1 according to your graphs.
> PREROUTING should be done on linux2
>
> Also, we need to see all your rules as you may have a -j DROP =
somewhere
that might be blocking it ie. ( -P FORWARD -j DROP )

My all rules on Linux1:
iptables -t nat -A POSTROUTING -s 10.0.2.2/32 -o eth0 -j SNAT --to =
(public
address)
iptables -A PREROUTING -t nat -p tcp -d (public address) --dport 23 -j =
DNAT
--to 10.0.2.2:23

On linux2:
iptables -t nat -A POSTROUTING -s 10.0.5.0/24 -o eth0 -j SNAT --to =
10.0.2.2
iptables -A PREROUTING -t nat -p tcp -d 10.0.2.2 --dport 23 -j DNAT --to
10.0.5.13:23

Port 23 is only an example. Please, help :(

Adi


