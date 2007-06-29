From: "Snow Wolf" <snowwolfv@gmail.com>
Subject: specify source port on NAT
Date: Fri, 29 Jun 2007 21:37:08 +0800
Message-ID: <6d86fd720706290637i60bb2fb3l12408f33e2a8bf4d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=Xru8vz1F70se1SMaAi2jbc3RIA7WuvtdaPwUIvorALk3sUL8bhvdiNCXa+qyR6iF5DEsItymJtjyX7LAY9NYiu97jFM/lRDGxvgCuURqJKQAOe3DUHpKb9XF1wQQYCwzdVTMYoRNSei/USYiCm2L18eo9dE5wpaDx5j5xfh0wXc=
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hello members,

My client has a strange requirement.When I made a nat firewall with
iptables for him,he need the forwarded package's source port was not
changed,or changed to a specified port which he can control.

For example,

192.168.1.1  --->   iptables(nat)  ---> www.aol.com
(sport: 1234)          (sport: 1234)       (dport:80)

He need that when a package was left from iptables,the source port was
still 1234.
(or something like 1235 is also ok,but he need to control it,it means
he can descide which port is the source port from iptables.)

How to do it?thanks.

