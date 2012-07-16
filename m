From: richard lucassen <mailinglists@lucassen.org>
Subject: recent question
Date: Mon, 16 Jul 2012 15:12:23 +0200
Message-ID: <20120716151223.e5eb4406717f6e0186d7ca7f@lucassen.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

Here are two "recent" rules:

/usr/sbin/iptables -A INPUT -p tcp --dport 25 -m recent \
  --update --seconds 60 --hitcount 5 --name smtp -j LOG_REJECT

/usr/sbin/iptables -A INPUT -p tcp --dport 25 -m recent --set \
  --name smtp -j ACCEPT

When telnetting for the first time to port 25, the source ip appears in

/proc/net/xt_recent/smtp

So far, so good. But there are 100 entries according to the manpage:

$ wc -l /proc/net/xt_recent/smtp
100

Correct. OTOH, I'm sure that within seconds the 100 entries will be
exceeded, according to the number of connections set up to the smtp
server:

# tcpdump -ni eth0 \
  'dst host 10.1.193.3 and tcp port 25 and tcp[13] == 2'
(outputs a few per second)

And according to /proc/net/ip_conntrack there are more than 100 entries
to 25/tcp.

Where are the entries 101 and higher in /proc/net/xt_recent/smtp?
Are they ignored? Or is the oldest automagically purged?

And when is an entry purged when the --reap is not used? Or does it
behave like a round robin FIFO?

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
