From: "Winanjaya - PBXSoftwares" <winanjaya@pbxsoftwares.com>
Subject: IP and MAC Address check
Date: Wed, 5 Oct 2005 11:24:46 +0700
Message-ID: <005d01c5c964$b7ccebe0$580110ac@HO.lippogeneral.com>
Reply-To: Winanjaya - PBXSoftwares <winanjaya@pbxsoftwares.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All,

I have list of Mac addresses and also have range of IP addresses.. how =
to set iptables with conditions below:

Range of IP addresses: 172.16.2.241 to 172.16.2.250

List of MAC Addresses: (stored in a file named maclist)
01:02:03:04:05:0a
01:02:03:04:05:0b
01:02:03:04:05:0c
01:02:03:04:05:0d
01:02:03:04:05:0e
01:02:03:04:05:0f
01:02:03:04:05:1a
01:02:03:04:05:2a
01:02:03:04:05:3a
01:02:03:04:05:4a

When Incoming package from the ranged IP address (172.16.2.241 to =
172.16.2.250)  then the mac address must be checked from the list of MAC =
Address, if the MAC Address matched then it allowed otherwise it will be =
rejected or dropped..


please advise

thanks a lot in advance

Regards
Winanjaya
