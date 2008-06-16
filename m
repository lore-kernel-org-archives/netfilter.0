From: "Gergely Buday" <gbuday@gmail.com>
Subject: VPN client from behind a firewall
Date: Mon, 16 Jun 2008 13:44:30 +0200
Message-ID: <90d975d30806160444t7c9bbf21if9b0062e2e72ac56@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=pvQcq63vriE+2SRAY1h3VV/CCBDgI1wQRwTmVvxLF3c=;
        b=shiIGvdjZXld6eQZQYyAnF/iRyUzTvpfJwB1EtegnQSwDeCqg0/DrJZuGjyF0bmfMe
         6KHB6RGji5DO9aenYL5gzLYPFBWJPlJCquIS3AX+NElxCsiYVMrD/VbPw+n9IaI7pA8A
         5AVkcLC5dzOw0Ku0h+BYGi2wF8CMunaI6op+E=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear All,

I would like to use a Cisco VPN client from behind my CentOS server,
which has an iptables firewall. The network topology is as follows:
eth0 is towards the ISP, eth1 heads the local clients. Up to now I
used

http://tldp.org/HOWTO/IP-Masquerade-HOWTO/firewall-examples.html#RC.FIREWALL-IPTABLES

but this clearly needs extension. What I know is that I should allow
the IPSec port (500) to be open. What else, and how? I'm not very
familiar with iptables, so some pointers would be more than welcome.

Best Wishes

- Gergely
