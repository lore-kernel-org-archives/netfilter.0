From: Eric Leblond <eleblond@init-sys.com>
Subject: Re: IPTables logging
Date: 04 Feb 2003 09:24:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044347073.11682.10.camel@porky>
References: <3E3F35B9.2040903@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E3F35B9.2040903@pobox.com>
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

Le mar 04/02/2003 =E0 04:38, Patrick Topping a =E9crit :
> Is it possible to have iptables log to some other file than the messages=20
> file on a linux server?? =20

Use Ulog, you've got the control of were you want to log (in a file) and
you can log in a database (psql or mysql).
Furthermore you can specify how much packets you ong at once, that
dramatically decrease filesystem I/O.

--
Eric


