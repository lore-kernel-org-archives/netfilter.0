From: "Marcos Hack" <marcoshack@gmail.com>
Subject: Re: DNAT Problems
Date: Mon, 24 Apr 2006 17:04:16 -0300
Message-ID: <842e837b0604241304k7a7952a2r4a8cee046b0d90bb@mail.gmail.com>
References: <20060424182225.9464.qmail@web54710.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060424182225.9464.qmail@web54710.mail.yahoo.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: dsylvesteriii@yahoo.com
Cc: netfilter@lists.netfilter.org

nat PREROUTING is ok.
filter FORWARD is ok.

Well, rules sounds good to me.

You said that all was working fine before a reboot. Do you install
some hardware in this machine? All interfaces (eth0, eth1) was
correctly configured after reboot?

And try to follow traffic using tcpdump on interfaces eth0 and eth1.



On 4/24/06, Davis Sylvester <dsylvesteriii@yahoo.com> wrote:
>
> For some reason my firewall was working fine until a
> reboot and now none of the DNAT is working.  The most
> important thing is that the e-mail server is not
> receiving mail, it sends just fine.  Also no one can
> access squirrel mail, again works fine internally.
>

> *nat
> :PREROUTING ACCEPT [6384:872118]
> :POSTROUTING ACCEPT [156:10133]
> :OUTPUT ACCEPT [1681:126170]
> -A PREROUTING -d 1.1.1.25 -i eth1 -p tcp -m tcp
> --sport 1024:65535 --dport 25 -j DNAT --to-destination
> 192.168.150.20
> -A PREROUTING -d 1.1.1.25 -i eth1 -p tcp -m tcp
> --sport 1024:65535 --dport 110 -j DNAT
> --to-destination 192.168.150.20
> -A PREROUTING -d 1.1.1.25 -i eth1 -p tcp -m tcp
> --sport 1024:65535 --dport 143 -j DNAT
> --to-destination 192.168.150.20
> -A PREROUTING -d 1.1.1.200 -i eth1 -p tcp -m tcp
> --sport 1024:65535 --dport 80 -j DNAT --to-destination
> 192.168.150.200

> :FORWARD ACCEPT [2955:564452]

> -A FORWARD -d 192.168.150.20 -i eth1 -o eth0 -p tcp -m
> tcp --sport 1024:65535 --dport 25 -m state --state NEW
> -j ACCEPT
> -A FORWARD -d 192.168.150.20 -i eth1 -o eth0 -p tcp -m
> tcp --sport 1024:65535 --dport 110 -m state --state
> NEW -j ACCEPT
> -A FORWARD -d 192.168.150.20 -i eth1 -o eth0 -p tcp -m
> tcp --sport 1024:65535 --dport 143 -m state --state
> NEW -j ACCEPT
> -A FORWARD -i eth0 -o eth1 -m state --state
> RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i eth1 -o eth0 -m state --state
> RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -d 192.168.150.200 -i eth1 -o eth0 -p tcp
> -m tcp --sport 1024:65535 --dport 80 -m state --state
> NEW -j ACCEPT

