From: Donald Schlicht <dschlic1@gmail.com>
Subject: Help with routing ping requests
Date: Tue, 21 Jul 2015 14:55:40 -0400
Message-ID: <CAA0NJicuYtbFfruAD_nM7HFhTzUtRpeW=oQ9Q3eNwMvXe6Y14A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=jPODCm88QB8OKf+VBqvczFQKWvQ3mIgnAQygZ+nTQRM=;
        b=D3Zu3pGv+WT3cZ4QfGNXaOa5UlIk2pVkJ6gp+4KMqJGwJbpbZVxE+e8qZUPAk331gU
         TeiE7JneATBGZXRkoGOelAbZfZQFI/iN/tEdXADq7MObZli5NfnUe3ot8jcKhsf1XngS
         ekmS7pPoBOLJMDTWTQa8DuYCfTKtOix2pfYyG5kJeLYxW/XSjlSewFtjom19K6vYC8nF
         j5Ox4IlJu9+g+EBVxXmVJUwtiepCuvenqQLVMlR276btiVrz7kJ+4WqVMxuRoE/hJDwx
         NTGPgi0dqVxR2GsZDy6+aUgCK79VjfoB0ExONldQmFYg3Hyojz+QbiNw9Vt4TShGmOF6
         J0zw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

 I have configured iptables to custom route some icmp packets. I have
set up logging and here is the log:

Jan  1 00:01:06 TAPC kern.debug kernel: [   73.720000] icmp_prerouting
IN=eth0 OUT= MAC=e0:46:9a:41:75:7e:00:0c:29:51:5b:9f:08:00
SRC=72.64.140.50 DST=72.64.140.67 LEN=60 TOS=0x00 PREC=0x00 TTL=128
ID=2192 PROTO=ICMP TYPE=8 CODE=0 ID=1 SEQ=17
Jan  1 00:01:06 TAPC kern.debug kernel: [   73.720000] icmp_forward
IN=eth0 OUT=br0 MAC=e0:46:9a:41:75:7e:00:0c:29:51:5b:9f:08:00
SRC=72.64.140.50 DST=192.168.1.200 LEN=60 TOS=0x00 PREC=0x00 TTL=127
ID=2192 PROTO=ICMP TYPE=8 CODE=0 ID=1 SEQ=17
Jan  1 00:01:06 TAPC kern.debug kernel: [   73.720000]
icmp_postrouting IN= OUT=br0 SRC=72.64.140.50 DST=192.168.1.200 LEN=60
TOS=0x00 PREC=0x00 TTL=127 ID=2192 PROTO=ICMP TYPE=8 CODE=0 ID=1
SEQ=17
Jan  1 00:01:11 TAPC kern.debug kernel: [   78.510000] icmp_forward
IN=eth0 OUT=br0 MAC=e0:46:9a:41:75:7e:00:0c:29:51:5b:9f:08:00
SRC=72.64.140.50 DST=192.168.1.200 LEN=60 TOS=0x00 PREC=0x00 TTL=127
ID=2193 PROTO=ICMP TYPE=8 CODE=0 ID=1 SEQ=18
Jan  1 00:01:16 TAPC kern.debug kernel: [   83.520000] icmp_forward
IN=eth0 OUT=br0 MAC=e0:46:9a:41:75:7e:00:0c:29:51:5b:9f:08:00
SRC=72.64.140.50 DST=192.168.1.200 LEN=60 TOS=0x00 PREC=0x00 TTL=127
ID=2194 PROTO=ICMP TYPE=8 CODE=0 ID=1 SEQ=19
Jan  1 00:01:21 TAPC kern.debug kernel: [   88.510000] icmp_forward
IN=eth0 OUT=br0 MAC=e0:46:9a:41:75:7e:00:0c:29:51:5b:9f:08:00
SRC=72.64.140.50 DST=192.168.1.200 LEN=60 TOS=0x00 PREC=0x00 TTL=127
ID=2195 PROTO=ICMP TYPE=8 CODE=0 ID=1 SEQ=20

The entries with prefix icmp_prerouting is from the -t nat PREROUTING
chain. The entries with prefix icmp_forward are from the -t filter
FORWARD chain. The entry with prefix icmp_postrouting is from the -t
nat POSTROUTING table. I also have loging in the INPUT and OUTPUT
chains. However no entries have been generated from those chains.

I have Wireshark connected to both the WAN side and the LAN side. I
see the packets going into the WAN which produces the above entries,
however I do not see any packets coming out either the LAN or the WAN
side.

Without any of my custom rules, I can ping the WAN interface without
issues. From within the Telenet shell I can also ping the address
192.168.1.200 without issues. On Wireshark both the incoming packets
and the outgoing packets show up as expected.

Does anyone have any idea where the outgoing packets disappear? Is br0
the correct output device so that the packet will be sent to the LAN
ports? This application is DD-WRT running on a Netgear router.
