From: "Leonardo Borda" <borda@netwall.com.br>
Subject: doubt about ip ranges
Date: Fri, 13 Jun 2003 21:08:12 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IHEHKFMEMKMGFDMIAHCIMEGEDNAA.borda@netwall.com.br>
Reply-To: <borda@netwall.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,

	I have a network 192.168.25.0 and I need specify the following rules:

	192.168.24.1 to 192.168.25.33 -> just should have HTTP access.
	192.168.24.34 to 192.168.25.133 -> just should have FTP access.
	192.168.24.134 to 192.168.25.254 -> just SSH access.

	I could do it using a loop for and creatiang one rule each time for each=
 ip
address. But I think this is not a best solution.

	I tried using: iptables -A FORWARD -p tcp -s 192.168.25.1-33 ... but was
not successful.

	Is there any way to make this works ?

	Thanks!


Atenciosamente,

Leonardo Borda
Netwall Tecnologia e Projetos - http://www.netwall.com.br
Fone/Fax: +55 51 3235.2868
Celular:  +55 51 9914.3039
mailto:borda@netwall.com.br

				/**  Construindo solu=E7=F5es em tecnologia voltadas ao seu neg=F3cio=
  **/

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.488 / Virus Database: 287 - Release Date: 5/6/2003


