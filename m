From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Source IP ADDRESS
Date: Sat, 5 Jul 2003 12:53:37 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDKEAINFAA.georgev@citadelcomputer.com.au>
References: <20030704162814.28056.qmail@web41504.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030704162814.28056.qmail@web41504.mail.yahoo.com>
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
To: Bissio <bissio2000@yahoo.it>, netfilter@lists.netfilter.org

Because the software your using is telling the server your connected to what
your IP is. Much like FTP does and ICQ etc..etc.. which is why special
connection tracking modules are required for those services.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Bissio
Sent: Saturday, July 05, 2003 2:28 AM
To: netfilter@lists.netfilter.org
Subject: Source IP ADDRESS


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
192.168.0.0/24 --dport 1:1023 -j ACCEPT

iptables -A FORWARD -p tcp -i eth1 -o eth0 -d
192.168.0.0/24 --dport 1024:65535 ! --syn -j ACCEPT

Why my private ip addres (192.168.0.10) is listed
instead my public address???

Thanks
Bissio


______________________________________________________________________
Yahoo! Mail: 6MB di spazio gratuito, 30MB per i tuoi allegati, l'antivirus,
il filtro Anti-spam
http://it.yahoo.com/mail_it/foot/?http://it.mail.yahoo.com/



