From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: iptables log analysis tool
Date: Tue, 30 Sep 2003 08:41:30 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C3B8@wardrive.citadelcomputer.com.au>
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

>which can generate some graphs using the log files.

this is a small project I'm working on using php (easier/quicker to make =
changes) and mysql to store the data in even of a reboot/etc...

http://mrtg.citadelcomputer.com.au

some of the above graphs are just scripts while others are using my =
mysql-iptables.php script to gather the `iptables -L -t $table -v -n -x` =
information.

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
From: Afshin Lamei [mailto:linux_st@hotmail.com]
Sent: Monday, 29 September 2003 9:41 PM
To: netfilter@lists.netfilter.org
Subject: iptables log analysis tool


hi all,
I want to analyse the iptables log files (using LOG and/or ULOG target). =

please help me find a proper tool for this, which can generate some =
graphs=20
using the log files.
regards
afshin

_________________________________________________________________
Add photos to your messages with MSN 8. Get 2 months FREE*.=20
http://join.msn.com/?page=3Dfeatures/featuredemail



