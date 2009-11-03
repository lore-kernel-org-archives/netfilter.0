From: Jeff Jensen <jjensen@unyalli.com>
Subject: Do I have this correct for FTP bandwidth usage?
Date: Tue, 3 Nov 2009 11:57:19 -0700
Message-ID: <b376a78e0911031057jebd6ba8mf482821d0b81545@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

# eth1 is internal eth0 is external
# user defined chain
iptables -t filter -N FTP
iptables -t filter -A FTP -j ACCEPT

# Filter Forwarding
iptables -t filter -A FORWARD -i eth1 -p tcp -m state --state
ESTABLISHED,NEW --sport 1024: --dport 21 -j FTP
iptables -t filter -A FORWARD -i eth0 -p tcp -m state --state
ESTABLISHED --sport 21 --dport 1024: -j FTP
iptables -t filter -A FORWARD -i eth1 -p tcp -m state --state
ESTABLISHED --sport 1024: --dport 20 -j FTP
iptables -t filter -A FORWARD -i eth0 -p tcp -m state --state
ESTABLISHED,RELATED --sport 20 --dport 1024: -j FTP
iptables -t filter -A FORWARD -i eth1 -p tcp -m state --state
ESTABLISHED,RELATED --dport 1024: --sport 1024: -j FTP
iptables -t filter -A FORWARD -i eth0 -p tcp -m state --state
ESTABLISHED --sport 1024: --dport 1024: -j FTP
