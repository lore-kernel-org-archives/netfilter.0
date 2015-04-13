From: Anna Fischer <a.fischer@sirrix.com>
Subject: Atomic changes to IP sets
Date: Mon, 13 Apr 2015 08:23:16 +0000
Message-ID: <ECC8F67CE961104EB2AFE8F7FD50F5D045F21A@exchange2010.sirrix.de>
References: <ECC8F67CE961104EB2AFE8F7FD50F5D045F1E6@exchange2010.sirrix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ECC8F67CE961104EB2AFE8F7FD50F5D045F1E6@exchange2010.sirrix.de>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


Hi,

I'm using ip sets in my iptables firwall rules. I don't just use those for firewalling, but also for packet mangling (marking). Now I'm quite frequently changing these sets and also the firewall rules. I know that I can atomically switch firewall rules by using iptables-restore. But how can I make changes to ip sets atomic? It seems to be as if packets are always passing the firewall whilst I do ipset commands. Currently I flush all ip sets, and then rebuild them. I understand this will cause problems because at times my ip sets are empty and so the firewall does not behave how I want it to behave. But what is the correct way to atomically update ip sets? I have seen that there is a command to swap an ip set. So I would build up a new set, then swap it with the old one, and then delete the
  old one. Is that the right way of changing ip sets? The other option would be to create a whole new set of ipsets and the a new set of iptables rules with these sets, and then I use iptables-restore to atomically switch the full firewall table. This seems like quite a bit of overkill though, doesn't it? Does anyone have an idea about how to best work with ip sets without building glitches into my firewall whilst reconfiguring ip sets?

Thanks for any pointers.

Anna





