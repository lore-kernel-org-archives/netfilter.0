From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: source-mac filtering
Date: Sun, 11 Jan 2004 17:50:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401111750.52867.Antony@Soft-Solutions.co.uk>
References: <Sea1-F167vrztUmdyB400051e33@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Sea1-F167vrztUmdyB400051e33@hotmail.com>
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

On Sunday 11 January 2004 5:39 pm, H=E5kan Engblom wrote:

> Yes, I've come to realize that.
>
> Is it technically necessary for the dhcp-server to do so, or could it b=
e
> that some other dhcpd behaves different ?

It is technically necessary, because DHCP clients do not have IP addressi=
ng=20
information when they begin the communication; everything is done using=20
ethernet broadcasts.   Such packets cannot be acquired using a standard=20
socket bind, so the server application needs to listen at a lower level t=
han=20
the TCP/IP stack allows.

Regards,

Antony.

--=20
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


