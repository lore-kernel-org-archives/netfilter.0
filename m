From: Eric Leblond <eleblond@inl.fr>
Subject: Re: how to use NF_QUEUE
Date: Wed, 09 Feb 2005 12:26:39 +0100
Message-ID: <1107948399.29502.2.camel@localhost.localdomain>
References: <20050209111625.40750.qmail@web50409.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050209111625.40750.qmail@web50409.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Le mercredi 09 f=E9vrier 2005 =E0 03:16 -0800, vinay mathew a =E9crit :=20
> Hi,
> I am a newbie regarding Netfilter.I need to use the
> Netfilter hooks for a project. I have tried out the
> hook functions using NF_ACCEPT, NF_DROP.I need to use
> NF_QUEUE to queue certain packets to the user space
> where i need to process them further and then send
> these packets back into the network stack.
> I have not done this before so does anyone have some
> simple sample code using this option so that i can get
> a start on how its done.

Use libipq, it's the easiest way to send packet to userspace and put
them back in the network stack. The man page contains some examples.=20

For a more concrete example you can have a look at the nufw project
(http://www.nufw.org).
The file src/nufw/packetsrv.c and src/nufw/authsrv.c contain code
example.

BR,
--=20
=C9ric Leblond, eleblond@inl.fr
T=E9l=E9phone : 01 44 89 46 40, Fax : 01 44 89 45 01
INL, http://www.inl.fr


