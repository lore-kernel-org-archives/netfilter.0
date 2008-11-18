From: "Darren Yang" <pigsign.pykota@gmail.com>
Subject: How can transfer Public IP packet inside NAT to outside Public IP site....
Date: Tue, 18 Nov 2008 17:44:22 +0800
Message-ID: <c914c50e0811180144p6c2b917dudf5c270d2ed077a0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=GPEH5YnBkDGI81wSbsKNp0hzBv7KoYv5d+Y9YWSHtMQ=;
        b=h2kvZYxYFaycXhDTPJ7e36Fu4n6cv5fJfiKVA7AilLJsuIGAXNu94Yu+SMCGO3eJxK
         NBPq+Uxh3kp6I4jXm2S5k2S8R+jgi9oUFh9Idr+A5bLyZX4oAzjaX+F5Bh/jOJ7HFup7
         uM+rw7q2zr90yehWDDDJ5qzcwUUuop5/Mfjx4=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All,

Because I must enable Cisco tunnel keepalive mechanism and Cisco
Router is at NAT inside...
I made a strange network lab like below...

PC01----(NAT inside eth0)Linux Firewall(NAT outside eth1)----Internet----PC02

PC01:
eth0 - 10.1.1.1
eth0:0 - 1.1.1.1
Default gateway: 10.1.1.254

Linux Firewall:
eth0 - 10.1.1.254
eth1 - 1.1.1.1

PC02:
eth0 -  2.1.1.1

How can use PC01's eth0:0 to ping PC02's eth0 successfully, like below..
-------------------------------------------------------
$ ping -I 1.1.1.1 2.1.1.1
-------------------------------------------------------

Linux Firewall iptables configuration:
-------------------------------------------------------
iptables -t nat -A POSTROUTING -s 1.1.1.1/32 -j SNAT --to 1.1.1.1
iptables -t nat -A PREROUTING -d 1.1.1.1/32 -j DNAT --to 10.1.1.1
-------------------------------------------------------

Thanks

pigsign
