From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: netfilter kernel crash in ip_ct_refresh_acct / ip_conntrack with centos 5.x
Date: Mon, 15 Sep 2008 11:11:56 +0300
Message-ID: <20080915081156.GK13941@edu.joroinen.fi>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello list!

Has anyone seen this netfilter kernel crash? 

Images from the console of the crashed firewall:
http://pasik.reaktio.net/centos5-kernel-crash/

Firewall is HP DL360 G4 server running CentOS 5.x 32 bit. 

I've seen this firewall crashing multiple times, but I only started investigating it lately..

It has happened using CentOS 5.0, 5.1 and now also with 5.2. I'm not sure if
it was the same bug earlier, but at least the last two times (with CentOS 5.2) 
it has been the same, see screenshots.

Last lines of the console output:

EIP: [<f8af2c5c>] __ip_ct_refresh_acct+0xa1/0x129 [ip_conntrack] SS:ESP 0068:c0724e4c
 <0>Kernel panic - not syncing: Fatal exception in interrupt

At the moment firewall is running CentOS 5.2, Linux kernel 2.6.18-92.1.10.el5.centos.plus.

Any tips how to resolve this? 

-- Pasi
