From: "uke uke" <master_uke@hotmail.com>
Subject: ftp download problems
Date: Thu, 20 May 2004 00:25:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY12-F95s16IXQbZtm00023278@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello.
Hello.
Please help me resolv the ftp downloads issue.
I am running Fedora Core 1 with  2.4.22-1.2188.nptl kernel and iptables=20
v1.2.9.
I have Bastille-Linux installed.
I am initializing the following modules: ipt_state, ip_conntrack,=20
ip_conntrack_ftp, ip_nat_ftp, iptable_nat, ipt_LOG.
Firewall has 3 interfaces: Internet, DMZ and LAN.  I have a FTP server=20
running vsftp in the DMZ. I am doing NAT from DMZ to Internet and from LAN =

to DMZ (translating to the address of the interface).

Clients from the internet can download things just fine, however, when I tr=
y=20
accessing the ftp server in DMZ from LAN the download goes down to 0.9 bps =

and then stops after few seconds. Uploads work fine.  Also if I use SSH to =

access my box in DMZ, it works fine, but as soon as I try to download=20
something (using ssh client) same thing happens.  I set up Microsoft FTP=20
server in the DMZ for testing and it worked fine.
Thank you for your time.
Alex K.

_________________________________________________________________
MSN Toolbar provides one-click access to Hotmail from any Web page =96 FREE=
=20
download! http://toolbar.msn.click-url.com/go/onm00200413ave/direct/01/


