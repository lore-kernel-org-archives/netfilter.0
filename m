From: andreas <andi@geekosphere.org>
Subject: UDP Scan detection with xtables-addon psd
Date: Thu, 11 Aug 2011 12:16:39 +0200
Message-ID: <4E43AC07.4040103@geekosphere.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

i'm working on a dynamic firewall and one sensor should be the portscan.
I want to detect port scans and forward them to the target that handles
the sensors and the blocking. So i saw that xtables-addons support
portscan with psd and lscan. As i want to scan also UDP scans i choose
psd instead of lscan.
But i can't get psd to detect nmap UDP scans. I played around with the
four values of psd but i never got the UDP scans logged. The TCP scans
are logged, at least nmap -sT, -sS, -sF, -sX, -sN are logged, -sA is
missing and so is the UDP scan with -sU.
I did not use any special nmap parameters except -P0. The machine is a
gentoo system with 2.6.38 Kernel, xtables addons 1.37 and iptables 1.4.11.1.

Does anyone know how psd can detect UDP scans? Did i miss anything?

And another question is, is the psd development stopped and do you
suggest to use lscan or do you have any other suggestion for me?

If not i guess i have to write my own modul or patch psd/lscan to get
the missing scans detected.

thanks so far and greetings from Germany,

Andi
