From: Piotr Pawlowski <piotr.pawlowski@goyello.com>
Subject: Problems with logging outgoing SMTP connections
Date: Fri, 28 Oct 2011 07:45:13 +0000
Message-ID: <47E0AF00D6313049B892E93D60AACDCA0C2E4751@DB3PRD0402MB102.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Dear all,

I would like to consult with you some iptables rule, which, in my opinion was sufficient for my needs, but it looks like I am making somewhere a mistake.
So I would like to log every outgoing SMTP connection from my server. What is more, I would like to log only those connections, which exceed 40 per minute limit. That is why I put following two lines into my iptables:

/sbin/iptables -I OUTPUT -p tcp --dport 25 -m state --state NEW -m recent --set
/sbin/iptables -I OUTPUT -p tcp --dport 25 -m state --state NEW -m recent --update --seconds 60 --hitcount 40 -j LOG --log-prefix "Out. SMTP con LIMIT: " --log-level 4

Unfortunately it doesn't work as I expected. I am testing it by performing following for loop from my server:

for i in {1..200} ; do echo "QUIT" | nc mailserver 25 ; done

Whole loop is finishing in around 30 seconds, so, in my opinion, there is more than 40 new outgoing SMTP connections from my server. Unfortunately, nothing is printed in log file.
BTW, I've changed syslog configuration file, so kern.warning logs are going to separate log file, so this is not an issue here.
What is more interesting, when I change hitcount value to 5, it suddenly starting to log all connections which exceed limits.

Where I am making a mistake?
Thank you in advance for any constructive tip.

Best Regards
--
Piotr Pawlowski





