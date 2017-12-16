From: =?UTF-8?Q?Toralf_F=c3=b6rster?= <toralf.foerster@gmx.de>
Subject: debug a --connlimit-above rule
Date: Sat, 16 Dec 2017 13:04:17 +0100
Message-ID: <3a442218-339c-ccf0-0d3e-7b089b867e85@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I do wonder if replacing "--syn" with "--match conntrack --ctstate NEW" in the following rule

	/sbin/iptables-A OUTPUT -p tcp --destination-port 443 --syn --match connlimit --connlimit-above 100 --connlimit-mask 0 --connlimit-daddr --match limit --limit 1/second -j LOG --log-prefix " rule hit "

makes any difference ?
My goal is to be informed if there're over 100 new conenctions to remote *:443 addresses within a 1 second period.

Furthermore are there any (/sys/ ?) files I could watch? Currently it seems that the rule misbehaves after a while. A restart of its appropriate iptable script every 10 min seems to help.

-- 
Toralf
PGP C4EACDDE 0076E94E
