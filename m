From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: doubt about ip ranges
Date: 14 Jun 2003 11:27:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055604467.1853.30.camel@alpha.newkirk.us>
References: <IHEHKFMEMKMGFDMIAHCIMEGEDNAA.borda@netwall.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <IHEHKFMEMKMGFDMIAHCIMEGEDNAA.borda@netwall.com.br>
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
To: borda@netwall.com.br
Cc: netfilter@lists.netfilter.org

On Fri, 2003-06-13 at 20:08, Leonardo Borda wrote:
> Hello,
>=20
> 	I have a network 192.168.25.0 and I need specify the following rules:
>=20
> 	192.168.24.1 to 192.168.25.33 -> just should have HTTP access.
> 	192.168.24.34 to 192.168.25.133 -> just should have FTP access.
> 	192.168.24.134 to 192.168.25.254 -> just SSH access.
>=20
> 	I could do it using a loop for and creatiang one rule each time for each=
 ip
> address. But I think this is not a best solution.
>=20
> 	I tried using: iptables -A FORWARD -p tcp -s 192.168.25.1-33 ... but was
> not successful.
>=20
> 	Is there any way to make this works ?
>=20
> 	Thanks!

If you are able to modify the ranges slightly, you could use this:

# 192.168.25.0-31 allowed HTTP
iptables -A FORWARD -s 192.168.25.0/27 -p tcp --dport 80 -j ACCEPT

# 192.168.25.32-63 allowed FTP
iptables -A FORWARD -s 192.168.25.32/27 -p tcp --dport 21 -j ACCEPT

# 192.168.25.64-127 allowed FTP
iptables -A FORWARD -s 192.168.25.64/26 -p tcp --dport 21 -j ACCEPT

# 192.168.25.128-255 allowed SSH
iptables -A FORWARD -s 192.168.25.128/25 -p tcp --dport 22 -j ACCEPT

j


> Atenciosamente,
>=20
> Leonardo Borda
> Netwall Tecnologia e Projetos - http://www.netwall.com.br
> Fone/Fax: +55 51 3235.2868
> Celular:  +55 51 9914.3039
> mailto:borda@netwall.com.br
>=20
> 				/**  Construindo solu=E7=F5es em tecnologia voltadas ao seu neg=F3cio=
  **/
>=20
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.488 / Virus Database: 287 - Release Date: 5/6/2003
>=20



