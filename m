From: Frank Gruellich <frank@der-frank.org>
Subject: Re: block port 137
Date: Wed, 4 Aug 2004 09:41:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040804074108.GK1067@der-frank.org>
References: <267354A234DF4D46AA6AE56E1240BEF004A3BF@tv.wcslnet.net> <002401c47917$d0a6fd70$858310ac@suarapembaruan.com> <1091513004.4660.34.camel@dc.nucleussoftware.com> <200408030717.59289.Antony@Soft-Solutions.co.uk> <00d601c479cf$352a91f0$858310ac@suarapembaruan.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00d601c479cf$352a91f0$858310ac@suarapembaruan.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

please don't toppost[1].

* david <david@suarapembaruan.co.id>  4. Aug 04:
> Dear Antony,

I'm not Antony.

> I agree with you, i must block all traffic and accept one-by-one rules that
> i want, but the problem is i don't know how to do this ....,

Okay, then do so.  Take a piece of paper, sketch you topology with every
network and add special hosts, like the mailserver at 172.16.128.50.
Then ask yourself: what should go from the internet to your subnet and
reverse.

This is you starting point (I sort it a bit, and please don't wrap
commands):

> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 202.46.146.161
> iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.164 --dport 25  -j DNAT --to 172.16.128.50
> iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.164 --dport 110 -j DNAT --to 172.16.128.50
> iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.165 --dport 25  -j DNAT --to 172.16.128.125
> iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.165 --dport 110 -j DNAT --to 172.16.128.125
> iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.166 --dport 80  -j DNAT --to 172.16.131.6
> iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.167 --dport 21  -j DNAT --to 172.16.128.79bie
> iptables -t nat -A PREROUTING -p tcp -i eth0 -d 202.46.146.168 --dport 21  -j DNAT --to 172.16.131.29
> 
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -p udp -s 0/0 --dport 137 -j DROP

# Set you default policy in FORWARD to DROP and flush it:
iptables -P FORWARD DROP
iptables -F FORWARD
# No allow everything you expect to pass you paketfilter.  I think you
# expect to pass all following pakets of an ACCEPTed stream:
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
# Now add everyting you need.  I can see, that you need mail-stuff vom
# outside to inside:
for $ip in 172.16.128.50 172.16.128.125
do for $port in 25 110
   do iptables -A FORWARD -i eth0 -p tcp -d $ip --sport 1024:65535 --dport $port -m state --state NEW -j ACCEPT
      iptables -A FORWARD -i eth0 -p tcp -d $ip --sport 1024:65535 --dport $port -m state --state NEW -j ACCEPT
   done
done
# same for http on .131.6 and ftp on .128.79 and .131.29
iptables -A FORWARD -i eth0 -p tcp -d 172.16.131.6  --sport 1024:65535 --dport 80 -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp -d 172.16.128.79 --sport 1024:65535 --dport 21 -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp -d 172.16.131.29 --sport 1024:65535 --dport 21 -m state --state NEW -j ACCEPT
# That's everything of your incomming traffic.  I can guess something
# about you outgoing:
iptables -A FORWARD -o eth0 -p tcp  --sport 1024:65535 --dport 21 -m state --state NEW -j ACCEPT
iptables -A FORWARD -o eth0 -p tcp  --sport 1024:65535 --dport 53 -m state --state NEW -j ACCEPT
iptables -A FORWARD -o eth0 -p udp  --sport 1024:65535 --dport 53 -m state --state NEW -j ACCEPT
iptables -A FORWARD -o eth0 -p tcp  --sport 1024:65535 --dport 80 -m state --state NEW -j ACCEPT
iptables -A FORWARD -o eth0 -p icmp -j ACCEPT
# This should satisfy you users: surfing and downloading.  I think, you
# mailservers are responsible for mails from users.  But they have to
# deliver the mails:
iptables -A FORWARD -i eth1 -p tcp -s 172.16.128.50  --sport 1024:65535 --dport 25 -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth1 -p tcp -s 172.16.128.125 --sport 1024:65535 --dport 25 -m state --state NEW -j ACCEPT
# Did you forgot something?  I don't know, you don't know, so let's log
# everything you may have forgot:
iptables -A FORWARD -j LOG --logprefix='FORWARD (unknown): '
# Check you logfiles and decide if you want to allow the logged traffic.
# Now be a good guy and make you machine rfc-compliant
iptables -A FORWARD -p tcp -j REJECT --reject-with tcp-reset
iptables -A FORWARD -p udp -j REJECT --reject-with icmp-host-prohibited

This would be my basic layout.  You should tweak it as needed.  Some
further tips:  RTFM <URL:http://iptables-tutorial.frozentux.net/>; use
userdefined chains (eg. you could split your FORWARD into an incomming
and an outgoing chain); use -j LOG and tail -f $logfile to determine
unknown traffic; tcpdumps are usefull too.

HTH,
 regards, Frank.
-- 
Sigmentation fault

