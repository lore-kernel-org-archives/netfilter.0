From: Danny <dannydebont@gmail.com>
Subject: Quick IP Blocking question
Date: Fri, 14 Mar 2014 15:58:51 +0200
Message-ID: <20140314135851.GA32244@fever.havannah.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Can you please check if the following rule is correct. The purpose of this rule
is to allow only access to youtube from 15:00 to 18:00

iptables -A OUTPUT -p tcp --dport 80 -d 208.65.153.238 -m time --timestart 15:00 --timeend 18:00 -j ACCEPT 
iptables -A OUTPUT -p tcp --dport 80 -d 208.65.153.238 -j REJECT

How can I modify the above rule to block a specific IP or MAC address from my
internal network to access youtube at specific times?

Thank you guys

Have a nice day

Danny
