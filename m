From: Santi <nagajuna@optushome.com.au>
Subject: RE:Question on ICMP
Date: Sun, 26 Jan 2003 17:02:00 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E3379D8.4050809@optushome.com.au>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.samba.org

Hello Guys,

     Is it possible to specify icmp type AND subtypes ( in numerical=20
format )
in iptables rules ? I know I can easily specify type, but I'm unsure about
subtypes ..


     Sincerily,
     Leonardo Rodrigues
     Solu=E7=F5es IP


Reply: You are able to define icmp subtypes, although I don't think
that it is possible to do it numerically.
For help on the types and subtypes issue the command from console:

$iptables -p icmp --help

This should show you the different types and subtypes that will
enable you to get finer grain control.

Santos.


