From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: can someone check this simple firewall?
Date: 14 Aug 2003 12:18:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060856335.1717.82.camel@kermit>
References: <20030814182810.GA2123@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030814182810.GA2123@linux.local>
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
To: Payal Rathod <payal-iptables@staticky.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Don, 2003-08-14 um 20.28 schrieb Payal Rathod:
> Hi,
> I have designed a simple firewall ruleset. Can someone please check
> them?=20
> It is kept at http://payal.staticky.com/firewall-1.txt
1. FTP, SSH and HTTP are only TCP. You can remove the UDP rules.
2. You should never see any packets coming from 127.0.0.1 going to any
other IP-address than 127.0.0.1. To allow localhost traffic just do
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

3. Last output rule seems bogus. You probably mean -d 0/0 but you can
omit that since it is the default value.

4. First and last rule in the Forward chain do the same. Drop one of
them. (I would drop the first one ;-)

5. You can use connection tracking for the INPUT and OUTPUT chains as
well.


Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

