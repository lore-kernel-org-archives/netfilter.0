From: Metal Gear <finattack@gmail.com>
Subject: SNATTING FTP
Date: Tue, 3 May 2005 18:05:13 +0600
Message-ID: <110c7844050503050579575350@mail.gmail.com>
Reply-To: Metal Gear <finattack@gmail.com>
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

Hi,=20
i wanted to do SNAT on FTP connections which are destined from my local=20
network to outside network. I tried the SNAT for ssh and it was working wit=
h=20
the following rule
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 <http://192.168.1.0/24> -p=
=20
tcp -m tcp --dport 22 -m state --state NEW -j SNAT --to
192.168.1.5<http://192.168.1.5>

I tried the following rules for FTP but it is no working

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 <http://192.168.1.0/24> -p=
=20
tcp -m tcp --dport ftp -m state --state NEW,ESTABLISHED,RELATED -j SNAT --t=
o=20
192.168.1.5 <http://192.168.1.5>

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 <http://192.168.1.0/24> -p=
=20
tcp -m tcp --sport ftp-data -m state --state NEW,ESTABLISHED,RELATED -j SNA=
T=20
--to 192.168.1.5 <http://192.168.1.5>

Can someone assist me in this situation.
Thanks
