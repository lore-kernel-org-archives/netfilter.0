From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Problem while connecting to internal FTP server behind firewall from external client.
Date: Sun, 15 Aug 2004 16:20:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051282@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

> HI, I am running FTP server in Windows 2003 and is perfectly working =
fine with other windows and Linux clients within the internal LAN. But I =
am not able to connect to this Server from external client(Linux).
> Let me describe about my network. I am running Linux firewall on =
gateway server. Windows FTP server is one of the internal LAN host. I =
have done nating to access the FTP server from external client. I am =
getting "227 entering passive mode" and after a while it times out. But =
I am able to see the directory and cd the desired directory. I am =
including configuration. I would be very thankful if anybody can help =
me.
> Thanks in advance!!!!!!!!!!
>
> root@abc root]# ftp 61.35.215.23
> Connected to 61.35.215.23 (61.35.215.23).
> 220-Microsoft FTP Service
> 220 This is New Wave Test site
> Name (61.35.215.23:root): administrator
> 331 Password required for administrator.
> Password:
> 230-You are welcome to this site if ur authorized else just get out of =
this place
> 230 User administrator logged in.
> Remote system type is Windows_NT.
> ftp> cd cham
> 250 CWD command successful.
> ftp> dir
> 227 Entering Passive Mode (192,168,1,98,10,58).
> receive aborted
> waiting for remote to finish abort

try:

modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

-j

