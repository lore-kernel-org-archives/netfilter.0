From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Do I need to write a module?
Date: 25 Jun 2003 11:02:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056531731.1851.7.camel@kermit.spenneberg.de>
References: <sef70417.087@mail.stone-ware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <sef70417.087@mail.stone-ware.com>
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
To: Tony Thompson <tony.thompson@stone-ware.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-06-23 um 20.43 schrieb Tony Thompson:
> I am investigating an option to use netfilter to allow/deny traffic from
> the local subnet based on rules/accounting information that is in
> another (Java based) system.  I am new to netfilter so, I can someone
> offer some suggestions:
Hi,
I am doing a similar thing just with apache and netfilter.

I have a webserver running on port 443 requiring authentication. The
webserver then calls a simple cgi-script:
--------------------------
#!/bin/bash
cat <<END
Content-Type: text/html

<center><H1>Hello $REMOTE_USER</H1>
<p>
<p>
Your IP-address $REMOTE_ADDR has been added for the next 3 minutes.
END
echo $REMOTE_ADDR >>address
--------------------------
A cron job runs every minute and checks for the file address and adds it
to the netfilter rules:
#!/bin/bash

if [[ -s /var/www/cgi-bin/address ]]
then
   read address < /var/www/cgi-bin/address
   rm -f /var/www/cgi-bin/address
   touch /var/www/cgi-bin/address
   chown apache /var/www/cgi-bin/address
   iptables -A u_remote -s $address -p tcp --dport 22 --syn\
            -m state --state NEW -j ACCEPT
   sleep 180
   iptables -D u_remote -s $address -p tcp --dport 22 --syn\
            -m state --state NEW -j ACCEPT
fi

Cheers,

Ralf
>=20
> 1. Is netfilter the right place to hook or should I look at a firewall
> that may provide some higher level hooks for authentication and
> accounting?
>=20
> 2. If I should hook into netfilter, is it a good idea to call into a
> JVM from a netfilter module?
>=20
> 3. I am not sure what kind of control I have when using the userspace
> driver but, should I use that in this situation?  Can I use that
> directly from Java so I wouldn't have the hassel of calling into a JVM
> from a native process?
>=20
> If anyone can offer any other suggestions or examples, that would be
> appreciated.
>=20
> Thanks.
> Tony
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                   =20
http://honeynet.spenneberg.org

