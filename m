From: =?iso-8859-1?q?Bissio?= <bissio2000@yahoo.it>
Subject: Source IP address
Date: Fri, 4 Jul 2003 09:48:32 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030704074832.35646.qmail@web41504.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I've a problem with masq... sometimes when i connect
to pubblic chat or other web services from my lan, i
see my source ip address (private network) listed. I
would see my pubblic ip address listed... i use this
rule:

iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o
eth1 -j SNAT --to public.ip.address

and in FORWARD rule:

iptables -A FORWARD -p tcp -i eth0 -o eth1 -s
192.168.3.0/24 --dport 1:1023 -j ACCEPT

iptables -A FORWARD -p tcp -i eth1 -o eth0 -d
192.168.3.0/24 --dport 1024:65535 ! --syn -j ACCEPT

Why my private ip addres (192.168.0.10) is listed
instead my public address???

Thanks
Bissio

______________________________________________________________________
Yahoo! Mail: 6MB di spazio gratuito, 30MB per i tuoi allegati, l'antivirus, il filtro Anti-spam
http://it.yahoo.com/mail_it/foot/?http://it.mail.yahoo.com/

