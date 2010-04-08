From: Shi Jin <jinzishuai@yahoo.com>
Subject: help need in understanding the ebtables MAC source
Date: Thu, 8 Apr 2010 11:42:37 -0700 (PDT)
Message-ID: <598239.66350.qm@web36203.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1270752157; bh=buF9OZUx3ucOFPez4zzpSeVL05mYfxLZtAg9eDPXMX0=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:MIME-Version:Content-Type; b=1++NIfoukS5PzYMswe1M/iF8NYv5iQwHTYNuhvAlV/RS8X9FoAtWx4Ctzco9E21ZzoyfwUfQ0qImqzRa9cDY7/HLAowHjYAbVt2833kAHPyZA5IgZyLFkiPGs/3Y/5LzYrLLJq3lqmNKs5VhfIjB2tSOh5GpCGL9g/YOtjC+kNU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: jinzishuai@gmail.com

Hi there,

I am doing some libvirt/kvm virtualization using bridged network.

I have the following ebtables rule:
ebtables -t filter -A FORWARD -p IPv4 -o vnet0 --ip-dst 209.5.171.7 --ip-proto tcp --ip-dport 22 --log-level debug --log-prefix "TCP" --log-ip --log-arp -j ACCEPT

Where vnet0 is the tap device created on br2 on top of eth3.

Then when I do an SSH connection to this VM at 209.5.171.7, my system log shows the following:
TCP IN=eth3 OUT=vnet0 MAC source = 00:01:30:05:7e:00 MAC dest = 00:00:d1:05:ab:07 proto = 0x0800 IP SRC=139.142.54.201 IP DST=209.5.171.7, IP tos=0x00, IP proto=6 SPT=62197 DPT=22

I can understand most of this record. The MAC dest is the MAC address seen inside the virtual machine.  However, I cannot understand MAC source. It is not the MAC address of vnet0, br2 or eth3, nor is it the MAC address of my client machine (or the routers). It seems to me that this address of "MAC source = 00:01:30:05:7e:00" is created out of nowhere. 
Could you please explain to me how this MAC source is used and is it possible to find it out on my Linux host with command such as ifconfig?

Thank you very much.

--
Shi Jin, PhD


      
