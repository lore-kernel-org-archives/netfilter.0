From: Pete Kay <petedao@gmail.com>
Subject: question about NAT rule
Date: Tue, 22 Jun 2010 22:20:52 +0800
Message-ID: <AANLkTimaYvRg2379FY2erzJTKyhXFjEtyvOtgqfYnV2d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=e8r/T26Vq3nqrULWYykKhnDzr8KYRC/GnV/jJAjdBdc=;
        b=GAsjzgpK7k4uoUj0y/6Hhgh8HTjAdkwagiUWfiBbLz0B58fJ1RygIFUSZqllwEs/D+
         y8FyUXTtqUO+TafrePjUmtjT3EBFoqRQ040AKOFaRnhuSOgQWjRGGTYLNLzLQi3Q5wwq
         iH5oeFXFVrYtpWp4XraDvcQ8avUrpkyKPX2ZI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have the following NAT rule set up :

udp      17 12 src=192.168.1.102 dst=192.168.1.140 sport=7390
dport=8000 packets=6 bytes=3258 [UNREPLIED] src=192.168.1.140
dst=192.168.1.102 sport=10000 dport=9000 packets=0 bytes=0 mark=0
secmark=0 use=2


What I am expecting to achieve is that when udp packets go from
192.168.1.102:7390 to 192.168.1.140:8000, the conntrack module would
redirect the packet to 192.168.1.102:9000, but it is not happening.

Does anyone know what is wrong?

From wireshark, I am seeing

100	11.732246	192.168.1.140	192.168.1.102	ICMP	Destination unreachable
(Port unreachable)


Any help will be greatly appreciated.

Thanks,
P
