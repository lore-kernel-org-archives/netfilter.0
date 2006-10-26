From: Balazs Fulop <balazs.fulop@initon.com>
Subject: multiple uplinks masquerading
Date: Thu, 26 Oct 2006 11:30:43 +0200
Message-ID: <45408043.2080403@initon.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050601020305050103050406"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------050601020305050103050406
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

I am on the list now. Sorry for causing too much traffic.


--------------050601020305050103050406
Content-Type: message/rfc822;
 name="multiple uplinks masquerading"
Content-Disposition: inline;
 filename="multiple uplinks masquerading"
Content-Transfer-Encoding: 7bit

Message-ID: <45407F91.2030201@initon.com>
Date: Thu, 26 Oct 2006 11:27:45 +0200
From: Balazs Fulop <balazs.fulop@initon.com>
User-Agent: Debian Thunderbird 1.0.2 (X11/20060926)
X-Accept-Language: en-us, en
MIME-Version: 1.0
To: netfilter@lists.netfilter.org
Subject: multiple uplinks masquerading
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable

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





--------------050601020305050103050406--

