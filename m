From: "Leandro Takashi Hirano" <takashi@alcidesmaya.com.br>
Subject: IP Spoofing
Date: Wed, 5 Nov 2003 17:31:16 -0200 (BRST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br>
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
To: Lista de Mail netfilter <netfilter@lists.netfilter.org>

Thanks for the port scanner help....

Now I would like to know about the IP Spoofing rule, how does it works?

-	iptables -A INPUT -s 192.168.1.0/24 -i ! eth0 -j DROP
-	iptables -A INPUT ! -s 192.168.1.0/24 -i eth0 -j DROP

I don=B4t know how can it block ip spoofing attack...

Takashi



