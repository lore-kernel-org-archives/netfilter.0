From: Kim Jensen <kimj@dawn.dk>
Subject: Re: What ports need to be open to allow for mail?
Date: Thu, 10 Apr 2003 13:20:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304101320.54473.kimj@dawn.dk>
References: <5.1.0.14.2.20030410122405.02794440@of23sm3.kadnet.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20030410122405.02794440@of23sm3.kadnet.dom>
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
To: netfilter@lists.netfilter.org

>I'm trying to set up my mail server; however I want to
>make sure that I have the correct port(s) open. I
>already have TCP port 25 open; however do I also have
>to have UDP port 25 open as well? Any help would be
>appreciated.
>
Extract from /etc/services:

SMTP:
smtp            25/tcp          mail
smtp            25/udp          mail
smtps           465/tcp                         # SMTP over SSL (TLS)

POP:
pop2            109/tcp         pop-2   postoffice      # POP version 2
pop2            109/udp         pop-2
pop3            110/tcp         pop-3           # POP version 3
pop3            110/udp         pop-3
pop3s           995/tcp                         # POP-3 over SSL
pop3s           995/udp                         # POP-3 over SSL

IMAP:
imap            143/tcp         imap2           # Interim Mail Access Pro=
to v2
imap            143/udp         imap2
imap3           220/tcp                         # Interactive Mail Access
imap3           220/udp                         # Protocol v3
imaps           993/tcp                         # IMAP over SSL
imaps           993/udp                         # IMAP over SSL

Now, make you picking, standard answer is:
25 for SMTP
110 for POP3
143 for IMAP

/Kim


