From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: tunneling and iptables
Date: Wed, 10 Mar 2004 11:11:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078913464.2757.34.camel@anduril.intranet.cartel-securite.net>
References: <5.2.1.1.2.20040310030818.00b40808@postoffice6.mail.cornell.edu>
	 <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
	 <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
	 <5.2.1.1.2.20040310030818.00b40808@postoffice6.mail.cornell.edu>
	 <5.2.1.1.2.20040310043513.00b315a8@postoffice6.mail.cornell.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.1.1.2.20040310043513.00b315a8@postoffice6.mail.cornell.edu>
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

Le mer 10/03/2004 =E0 10:38, Hitesh Ballani a =E9crit :
> Sorry to bug you  ... that ROUTE extension is perfect for me  ...

Fine :)

> but with my design I will have around 2000~  tunnels created (i know
> this sounds crazy).. will the kernel be able to handle this or is this
> too much of an overhead .... leaving aside the start up overhead,
> during the actual forwarding is there any overhead besides the extra
> ip header being attached....

I must admit I don't know if kernel will be able to handle 2000 logical
interfaces, as I'm not a kernel guru. Maybe you should ask kernel
mailing list.

Speaking of tunneling overhead, it will closely depend on which
tunneling techno you use (defines additionnal header, compression and
encryption) and the medium that supports the tunnel (defines MTU). Most
of the time, overhead is very low. IPIP tunneling will use one more IP
header, GRE tunnel a couple of bytes more, etc., and regarding a 1500
bytes MTU, we're still around 2% or 3% of overhead one full frame,
without any compression or encryption. Now you can use stuff like PPP
over SSL that has overhead, compression and encryption, SSH stuff or
IPSEC stuff, or whatever you may want to use :)

So you have three things :

        . header overhead
        . compression (that can beat the overhead) [1]
        . encryption

I would be more worry by the computing time necessary to decapsulate
packets if you use compression or encryption, and the latency (and maybe
packet loss) it can induce.


[1] I remember a time when it was faster for me to read my mail via POP
    over SSH than plain clear just because SSH uses compression. When
    security meet end-user needs ;)

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

