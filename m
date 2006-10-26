From: Balazs Fulop <balazs.fulop@initon.com>
Subject: multiple uplinks masquerading
Date: Thu, 26 Oct 2006 11:27:45 +0200
Message-ID: <45407F91.2030201@initon.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Dear List!

I am a system administrator at an IT company. We have recently
subscribed to a PPPoE Internet connection besides the one we are
currently using. I thought it would be a good idea to use them in
parallel, as described in the LARTC HOWTO
(http://lartc.org/howto/lartc.rpdb.multiple-links.html). I have set up
the two pppoe connections as described there and created the following
two rules in my iptables setup:
-t nat -A POSTROUTING -o ppp0 -j MASQUERADE
-t nat -A POSTROUTING -o ppp1 -j MASQUERADE
It worked more or less. In most cases the HTTP downloads were faster,
however, we had strange experiences. Sometimes SSH didn't seem to work
at all. SSH client asked for a password, but after that it hanged. FTP
never worked, but I have a thought that it won't ever work because of
that it uses two ports (control, data), and my links are weighted 1 - 1.
Important versions:
Linux 2.6.17.11-grsec
iproute2-ss041019
iptables v1.3.5
Could you please tell me if I did anything wrong? Please answer to the
sender address, I am not on the list. Thanks in advance.

F=FCl=F6p Bal=E1zs




