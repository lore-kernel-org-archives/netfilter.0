From: Brent Clark <bclark@eccotours.biz>
Subject: port 113 ?
Date: Thu, 13 Jan 2005 09:59:22 +0200
Message-ID: <41E62A5A.9000106@eccotours.biz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070007080700030107080203"
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
To: iptables <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.
--------------070007080700030107080203
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all

on my debian fw, im running virtually no services (as to which is the
law) on my fw:

gate:~# netstat -ln
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0:113             0.0.0.0:*               LISTEN
tcp        0      0 192.168.111.10:22       0.0.0.0:*               LISTEN
tcp        0      0 192.168.111.10:3128     0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN
udp        0      0 0.0.0.0:33644           0.0.0.0:*
Active UNIX domain sockets (only servers)
Proto RefCnt Flags       Type       State         I-Node Path
gate:~#


Soo I would like to know, if it is advisable to stop identd. I have
googled abit and from what I gather, its considered as dangerous and
basically pointless to run. By removing / stopping this service, will it
hamper hinder my users, other servers in any other way. I only run a
mail and ftp server.

Kind Regards and thanks inadvance
Brent Clark


--------------070007080700030107080203--

