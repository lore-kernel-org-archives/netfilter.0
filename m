From: "Yogesh Patil" <yogesh@technotux.net>
Subject: Squid transparent proxy /iptables (Yahoo messenger/Gmail/Https not works)
Date: Mon, 28 Jan 2008 00:41:30 +0530
Message-ID: <54a362580801271111vbc33fd6vf732922cd3b24@mail.gmail.com>
Reply-To: yogesh@technotux.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
     I am using SQUID 2.6.STABLE17 with fedora core 8, & BIND
DNS SERVER configured on the same box, i have configured squid as
transparent proxy with all default settings , and applied iptables
rule by using the following
command

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
--to-port 3128

     so the problem is that i am able to browse websites very well,
but Gmail, Yahoo Messenger, MSN Messenger etc.. and all the websites
using https not works, what would be the issue ?

Regards,
Yogesh Patil
