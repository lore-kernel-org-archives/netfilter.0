From: "Zander" <zander@subatomic.org.uk>
Subject: Re: ssh
Date: Wed, 15 Jan 2003 12:09:55 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012101c2bc8f$04264f80$96ae6f83@classics.cam.ac.uk>
References: <20ED00AA0BC135449469D6EF0AE79C971046@ozlan.fcdomain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: "Simpson, Doug" <dsimpson@friedmancorp.com>, netfilter@lists.netfilter.org


> whoops - forgot this is a dual homed computer and I am opening the eth0 to
> the outside world for ssh.
> I did find this -
> iptables -A INPUT -p tcp --syn --destination-port 22 -j ACCEPT
> iptables -A INPUT -p tcp --syn -j DROP
> this confuses me because of the "DROP" and the "--syn"
> Thanks,
> Doug
>
> -----Original Message-----
> From: Simpson, Doug
> Sent: Tuesday, January 14, 2003 1:59 PM
> To: 'netfilter@lists.netfilter.org'
> Subject: ssh
>
>
> I have acomputer I want to ssh to from the internet.  What is the IPTABLES
> command to open this port?
> Thanks,
> Doug
>

if you're opening ssh to the machine itself then:

/sbin/iptables -A INPUT -p tcp -i eth0 -d <eth0 IP address> --dport 22 -j
ACCEPT
/sbin/iptables -A OUTPUT -p all -o eth0 -m state --state
RELATED,ESTABLISHED -j ACCEPT

if for a host behind the firewall:

/sbin/iptables -A FORWARD -p tcp -i eth0 -o ethx -d <ssh server
ipaddress> --dport 22 -j ACCEPT
/sbin/iptables -A FORWARD -p all -m state --state RELATED,ESTABLISHED -j
ACCEPT

some of those interface settings aren't compulsary like in the forward chain
but I like to put them in. I would suggest them though for the INPUT and
OUTPUT chains as you have more than one interface. Oh and maybe set the
default policy of all to DROP.

HTH

Zz


