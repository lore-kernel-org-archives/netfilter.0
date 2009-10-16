From: Ralph Blach <rcblach@gmail.com>
Subject: how to drop an log packets
Date: Fri, 16 Oct 2009 10:13:00 -0400
Message-ID: <4AD87F6C.3010402@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=xOUxt5t429K5uWXj5MTBRXFEaOvBzugDYrGdcBtbyyk=;
        b=Li1Fsm3fb2ptDMPNgjN+2BGyukO35yEVRmTCJvekAeIqVC2d2mbMExAyC+ZlHxuZgd
         8Kpdd7lLIq136IuKC3raTDj4A6dlXEt+3X+QeSYIQLo6Ck6s5wapEA3w70zXL3aqymy9
         Af8pHdglrZ5oOjOKSayIRd6gaAjZdO1GZ2NsY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

good evening,
I have a Linksys firewall that forwars all packets from port 22 to my 
linux server
I want to log certain packets and drop certain subnets.

I currently have the following macro.


/sbin/iptables -N LOGDROP
/sbin/iptables -A LOGDROP    -i wlan0 ! -s 10.0.0.2 -j LOG --log-level info
/sbin/iptables -A LOGDROP -j DROP
/sbin/iptables -A INPUT -i wlan0 -s    58.102.198.29/255.255.255.0 -j 
LOGDROP

What I really wan to do is log address and excluding certain subnets, 
and address, but drop others on offending networks.
So I want to log addresses to wlan0 whose source address is not 
10.0.0.2, but drop subnets which I exclude.

What is the best way to do this

 Thanks

Chip
