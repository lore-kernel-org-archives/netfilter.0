From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Problems with my mail server
Date: 16 Apr 2003 22:28:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050546489.22423.4.camel@alpha.newkirk.us>
References: <20030416125602.18155.44510.Mailman@kashyyyk>
	 <098601c30486$14521bc0$0f00a8c0@juancarlitos>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <098601c30486$14521bc0$0f00a8c0@juancarlitos>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: juanca <juanca@sat.com.py>
Cc: netfilter@lists.netfilter.org

On Wed, 2003-04-16 at 22:07, juanca wrote:
> I=B4ve implemented this firewall but when I started it
> My mail server doesn=B4t work
> what might it be problem?
> iptables -A INPUT -s 192.168.0.15 -j ACCEPT
> iptables -A INPUT -s 192.168.0.25 -j ACCEPT
>=20
> iptables -A INPUT -s 127.0.0.1 -j ACCEPT
>=20
> iptables -A INPUT -p tcp --dport domain -j ACCEPT

DNS usually runs on udp 53, not tcp.  Also, you probably shoud have udp
53 open in OUTPUT as well as INPUT.

> iptables -A INPUT -p tcp --dport http -j ACCEPT
> iptables -A INPUT -p tcp --dport https -j ACCEPT
> iptables -A INPUT -p tcp --dport ftp -j ACCEPT
> iptables -A INPUT -p tcp --dport ftp-data -j ACCEPT
> iptables -A INPUT -p tcp --dport ftps -j ACCEPT
> iptables -A INPUT -p tcp --dport ftps-data -j ACCEPT
> iptables -A INPUT -p tcp --dport pop3 -j ACCEPT
> iptables -A OUTPUT -p tcp --dport pop3 -j ACCEPT
> iptables -A INPUT -p tcp --dport pop3s -j ACCEPT
> iptables -A INPUT -p tcp --dport  smtps -j ACCEPT
> iptables -A INPUT -p tcp --dport smtp -j ACCEPT
> iptables -A OUTPUT -p tcp --dport smtp -j ACCEPT -j ACCEPT
> iptables -A INPUT -p tcp --dport 113 -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -j DROP

Do you have DROP policy for INPUT (and/or OUTPUT)?  If so,
you don't need this last rule.  If not, you probably should.

j



