From: Fernando Martins <martinsfernand@gmail.com>
Subject: Mail server behind a firewall
Date: Mon, 21 Nov 2005 22:10:53 +0100
Message-ID: <7834b9550511211310n25ec94f5q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

 I have been looking for a solution for days and nights and I can't
find any solution to my problem.
 I have installed a Mail server behind a firewall , firewall I have
configured very badly with iptables.
 I want an exterior smtp server to be able to speak with mine but it is fai=
ling.
  My configuration is:



 INTERNET---------------------------------FIREWALL-------------------------=
------MAIL
SERVEUR
 ----------------------------------------------eth0-----------eth1---------=
----------------PrivateIP

 eht0 is the public interface with public adress A.


 How can I do this?


 Nandao
 nervous break down is close

