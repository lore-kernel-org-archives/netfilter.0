From: "Diego K." <diegok@gmail.com>
Subject: PREROUTING problem
Date: Mon, 27 Aug 2007 16:26:45 +0200
Message-ID: <560582340708270726m77e3467eo46b6ac91e034605b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=spOCqYrSHgZqZUsySpa06FcgT1Qb02eCmgrxmQoOoMmvCy7IusBRn5egoAYhFqB61yDn/yk31n1HxcfTMUWda9AVSiVarOxUizEql7coVtSQONgr4QqKXCYg8jwstSzz5tGdb4L/Cw/WY+vxWP51A1GF82owUn5KHELit4eAeUs=
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

Hello, I have the following problem





LAN ---------------------------------Etch Linux
Firewall-----------------------------------------------------Internet
10.1.x.x/16    |             eth1:10.1.1.1             eth0:200.3.5.100
                        |
                        |
                        |
Server1: 10.1.1.50


When I get a conection from the internet to 200.3.5.100:80, the ip
forward works OK to server1, but when I try to connect to 200.3.5.100
from the LAN its does not work, I know that i can connect to 10.1.1.50
but I need from both IPs, private and public from the LAN

I have the following config

iptables -t nat -A PREROUTING -s 0/0 -p tcp -d 200.3.5.100 --dport 80
-j DNAT --to 10.1.1.50:80
iptables -A FORWARD -p tcp -d 10.1.1.50 --dport 80 -j ACCEPT

Thanks in advance

