From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: test firewall with nmap
Date: Wed, 30 Oct 2002 14:53:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210301453.24586.roy@karlsbakk.net>
References: <006f01c28000$6eba65a0$1801010a@demo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006f01c28000$6eba65a0$1801010a@demo>
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
To: Ben Tan <linuxnewbie74@hotmail.com>, netfilter@lists.netfilter.org

On Wednesday 30 October 2002 11:38, Ben Tan wrote:
> hi,
>     I used nmap -v -sS -O xxx.xxx.xxx.xxx to check for any open ports, =
it
> it enough?
>
>     Any tool to recommend?

that only scans for open TCP ports
you should probably do -sU (udp), -sA (ack) scans (to bypass some bad=20
filters), and perhaps -sO (protocol scans)

--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


