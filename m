From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: UDP connections and Conntrack...
Date: Mon, 5 Jan 2004 13:33:01 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0401051332170.15139-100000@blackhole.kfki.hu>
References: <1073106266.24037.13.camel@gamux>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073106266.24037.13.camel@gamux>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eddahbi Karim <installation_fault_association@yahoo.fr>
Cc: netfilter@lists.netfilter.org

On Sat, 3 Jan 2004, Eddahbi Karim wrote:

> When a client sends an UDP datagram to an UDP server, the connection is
> ESTABLISHED when the server sends back an UDP datagram and the client
> sends another UDP datagram or does the connection is ESTABLISHED when
> the server answer to the first UDP datagram ?
>
> For example, is it like that :
>
> Client -> DATA -> Server
> Client <- DATA <- Server
>
> Connection ESTABLISHED for the server !

This one happens in conntrack for UDP.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


