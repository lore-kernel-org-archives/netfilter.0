From: richard lucassen <mailinglists@lucassen.org>
Subject: [mangle table] end rule
Date: Mon, 14 Jan 2013 21:42:25 +0100
Message-ID: <20130114214225.4a10201014b466ebf87eba94@lucassen.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have these two rules in this order:

iptables -t mangle -i eth0 -d 10.0.0.0/24 -j CONNMARK --set-mark 1
iptables -t mangle -i eth0 -d 10.0.0.2 -j CONNMARK --set-mark 2

This site
http://www.linode.com/wiki/index.php/Netfilter_IPTables_Mini_Howto#mangle_Table
says:

<quote>
It is important to notice when making rules that whichever rule matches
first will be the target for the packet and no other rules will be
checked.
</quote>

As far as I understand the English language, this means that a packet
towards 10.0.0.2 will be marked "1" and not "2" as the first rule
matches and thus the other rules will not be tested.

But in practice, destination 10.0.0.2 will be marked with "2" in the
order mentioned above. This is no what the site says.

Question: is a mangle rule really an end rule as the site suggests? Or
is this not true ("man iptables" says nothing about it AFAICS). Or is
it true and do I have to report a bug?

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+
