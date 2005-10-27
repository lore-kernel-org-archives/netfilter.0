From: Peter.Muller@gmx.at
Subject: ipq_read error
Date: Thu, 27 Oct 2005 12:08:51 +0200 (MEST)
Message-ID: <12274.1130407731@www36.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello!

I'm using libipq's ipq_read function in a program to read packets that were
queued to userspace by a kernel module.

When I run the program as root everything is fine. ipq_read gets all the
queued messages. If the program is run with user privileges ipq_read fails.
ipq_get_msgerr(buf) returns 1 and ipq_errstr returns "Unknown error".

In the program I do the following:

[left out]

int status;
unsigned char buf[2048];
struct ipq_handle *h;
h =3D ipq_create_handle(0, PF_INET);
if (!h)
    die(h);

status =3D ipq_set_mode(h, IPQ_COPY_PACKET, BUFSIZE);
if (status < 0)
    die(h);

status =3D ipq_read(h, buf, BUFSIZE, 0);
printf("Received packet!\n");
if (status < 0)
    die(h);
printf("Alive!\n");
switch (ipq_message_type(buf)) {
    case NLMSG_ERROR:
        fprintf(stderr, "Received error message %d\n",
            ipq_get_msgerr(buf));
        break;

[left out]

Does ipq_read really needs root privileges or are there other solutions? Any
help on this is appreciated.

Cheers
Peter




--=20
Lust, ein paar Euro nebenbei zu verdienen? Ohne Kosten, ohne Risiko!
Satte Provisionen f=FCr GMX Partner: http://www.gmx.net/de/go/partner

