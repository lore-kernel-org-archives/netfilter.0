From: "Ron Lai" <ronlai@cs.stanford.edu>
Subject: Problems with nf_nat_ftp.ko and nf_conntrack_ftp.ko in 2.6.22.6
Date: Sun, 21 Oct 2007 15:08:22 -0700
Message-ID: <001f01c8142e$e6a67960$ea50f53c@FireEye.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hi all,
My 2.6.22.6 Linux box is acting as a NAT device. I found that a NATted FTP 
client is having problem using active mode to connect to a outside FTP 
server. (Passive mode works fine.)

From the trace I could see that the PORT command from the FTP client is 
correctly modified by the Linux box to use the converted NAT address. 
However, the confirmation from the server never makes it to the client and 
the client just keeps retransmitting the PORT command packet.

The interesting part is that active mode can work if the length of the 
actual IP address of the client is the same as the length of the converted 
NAT address. It looks like if there is no TCP sequence number modification 
by the Linux box, the FTP connection can work properly in active mode. I am 
suspecting that there may a problem in the TCP sequence number tracking in 
the kernel modules.

The same settings work fine when I try with Linux 2.6.15 loading 
ip_nat_ftp.ko and ip_conntrack_ftp.ko. Did I miss anything in configuring 
the Linux 2.6.22.6 box?

Regards,
Ron 

