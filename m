From: "Leonardo Borda" <borda@netwall.com.br>
Subject: RES: doubt about ip ranges
Date: Sun, 15 Jun 2003 17:23:44 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IHEHKFMEMKMGFDMIAHCICEGIDNAA.borda@netwall.com.br>
References: <1055604467.1853.30.camel@alpha.newkirk.us>
Reply-To: <borda@netwall.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1055604467.1853.30.camel@alpha.newkirk.us>
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
To: Joel Newkirk <netfilter@newkirk.us>
Cc: netfilter@lists.netfilter.org

People

	I found in
http://www.netfilter.org/documentation/pomlist/pom-base.html#iprange that
solve my problem.
	Does anyone have tested it?

thanks to all.

Best regards!




-----Mensagem original-----
De: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]Em nome de Joel Newkirk
Enviada em: s=E1bado, 14 de junho de 2003 12:28
Para: borda@netwall.com.br
Cc: netfilter@lists.netfilter.org
Assunto: Re: doubt about ip ranges


On Fri, 2003-06-13 at 20:08, Leonardo Borda wrote:
> Hello,
>
> 	I have a network 192.168.25.0 and I need specify the following rules:
>
> 	192.168.24.1 to 192.168.25.33 -> just should have HTTP access.
> 	192.168.24.34 to 192.168.25.133 -> just should have FTP access.
> 	192.168.24.134 to 192.168.25.254 -> just SSH access.
>
> 	I could do it using a loop for and creatiang one rule each time for ea=
ch
ip
> address. But I think this is not a best solution.
>
> 	I tried using: iptables -A FORWARD -p tcp -s 192.168.25.1-33 ... but w=
as
> not successful.
>
> 	Is there any way to make this works ?
>
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
>
> Leonardo Borda
> Netwall Tecnologia e Projetos - http://www.netwall.com.br
> Fone/Fax: +55 51 3235.2868
> Celular:  +55 51 9914.3039
> mailto:borda@netwall.com.br
>
> 				/**  Construindo solu=E7=F5es em tecnologia voltadas ao seu neg=F3c=
io  **/
>
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.488 / Virus Database: 287 - Release Date: 5/6/2003
>




---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.488 / Virus Database: 287 - Release Date: 5/6/2003

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.488 / Virus Database: 287 - Release Date: 5/6/2003


