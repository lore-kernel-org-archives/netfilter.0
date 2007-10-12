From: shacky <shacky83@gmail.com>
Subject: Ulogd-MySQL tables specifications
Date: Fri, 12 Oct 2007 16:42:36 +0200
Message-ID: <7fedbc910710120742g492a407cj1a85c4b6124b463f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=2r0v4Hfj8y8GVug75C0VC6WJPt2ycgJa1LRdvYWlCLY=;
        b=ZJHiYPAgrBFmrcu5+14RmGNfS30QMIKbv6zYFjZlVi4bxDNrj2NCYx5qXb4C/mP2DzAYVp+mugNJtUaNoUhoU9/AdNnDhpCMm5UpYMeCvASrj34Zfput5aeRFnG+hXwBHt9IzLSPq1jhRvUh39Jb02r6XBxvm1O/mzzBm+v9+YE=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi.
I'm writing a web interface for Ulogd, and I need to know how the
MySQL "ulog" table's columns in the database are formed.
For example, if I try to send a bad packet to the firewall, I get this
log in the Ulogd MySQL table:

id = 1 (which is the ID of the record)
raw_mac = 00:0c:29:d6:50:04:00:11:95:5f:d2:bf:08:00 (what MAC address
is this? How I can get this?)
oob_time_sec = 1192200188 (what is this?)
oob_time_usec = 724256 (what is this?)
oob_prefix = Shorewall:lan2fw:DROP: (the prefix wrote by Shorewall)
oob_mark = 0 (what is this?)
oob_in = eth0 (the "in" interface)
oob_out = [blank] (the "out" interface, it is blank because it isn't a
forwarded packet)
ip_saddr = 3232235887 (this should be "192.168.1.111", but how I can get this?)
ip_daddr = 3232235807 (this should be "192.168.1.31", but how I can get this?)
ip_protocol = 1 (this should be "icmp", what are all the other values?)
ip_tos = 0 (what is this?)
ip_ttl = 128 (what is this?)
ip_totlen = 60 (what is this?)
ip_ihl = 5 (what is this?)
ip_csum = 20718 (what is this?)
ip_id = 26100 (what is this?)
ip_fragoff = NULL (what is this?)
tcp_sport = NULL (this is the TCP source port)
tcp_dport = NULL (this is the TCP destination port)
tcp_seq = NULL (what is this?)
tcp_ackseq =  NULL (what is this?)
tcp_window =  NULL (what is this?)
tcp_urg =  NULL (what is this?)
tcp_urgp =  NULL (what is this?)
tcp_ack =  NULL (what is this?)
tcp_psh =  NULL (what is this?)
tcp_srt =  NULL (what is this?)
tcp_syn =  NULL (what is this?)
tcp_fin =  NULL (what is this?)
udp_sport = NULL (this is the UDP source port)
udp_dport = NULL (this is the UDP destination port)
udp_len = NULL (what is this?)
icmp_type = 8 (this it the ICMP type)
icmp_code = 0 (what is this?)
icmp_echoid = 1024 (what is this?)
icmp_echoseq = 27929 (what is this?)
icmp_gateway = NULL (what is this?)
icmp_fragmtu = NULL (what is this?)
pwsniff_user = NULL (what is this?)
pwsniff_pass = NULL (what is this?)
ahesp_spi = NULL (what is this?)

Could you help me to understand the values I didn't know, please?

Thank you very much!
Bye.
