From: "Leonardo Rodrigues Magalhaes" <leolistas@solucoesip.net>
Subject: Re: question on ip_conntrack log entries and behavior
Date: Fri, 21 Mar 2003 08:32:36 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c2ef9d$932eb190$3201a8c0@ESTACAO>
References: <Pine.LNX.4.33.0303201500280.17210-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter ML <netfilter@lists.samba.org>


    OK ......... i downloaded latest patch-o-matic snapshot, get a new
kernel 2.4.20 source tree and tried to aplly the needed patchs. But, I got a
problem here ....

    Seems I need submitted/10_confirm_fix.patch to fix the CLOSE stuff .....
but I also need tcp-window-tracking.patch for allowing deal with conntrack
timeouts in kernel runtime. But both patchs seems to change the SAME line in
two files. So, I cannot apply the two. I can only apply one of them ( any
one ) and it will apply correctly. The other will always fail.

    Problem seems to be:

hunk from submitted/10_confirm_fix.patch

--- linux-2.4.20-base/net/ipv4/netfilter/ip_conntrack_proto_tcp.c       Tue
Feb 18 17:07:26 2003
+++ linux-2.4.20-del/net/ipv4/netfilter/ip_conntrack_proto_tcp.c        Fri
Feb 21 17:03:35 2003
@@ -192,7 +192,7 @@
           have an established connection: this is a fairly common
           problem case, so we can delete the conntrack
           immediately.  --RR */
-       if (!(conntrack->status & IPS_SEEN_REPLY) && tcph->rst) {
+       if (!test_bit(IPS_SEEN_REPLY_BIT, &conntrack->status) && tcph->rst)
{
                WRITE_UNLOCK(&tcp_lock);
                if (del_timer(&conntrack->timeout))
                        conntrack->timeout.function((unsigned
long)conntrack);

    in extra/tcp-window-tracking.patch file, I have, among several other
changes:

-       if (!(conntrack->status & IPS_SEEN_REPLY) && tcph->rst) {
+       if (!(conntrack->status & IPS_SEEN_REPLY)) {

    Question ...... and now, what should I do ?? :) It would be very
interesting to me having both patchs applied. Do the mainteners of these
patchs are subscribed to this list ? If yes, can you help me ?


    Sincerily,
    Leonardo Rodrigues

----- Original Message -----
From: "Jozsef Kadlecsik" <kadlec@blackhole.kfki.hu>
To: "Leonardo Rodrigues Magalhaes" <leolistas@solucoesip.net>
Cc: "netfilter ML" <netfilter@lists.samba.org>
Sent: Thursday, March 20, 2003 11:04 AM
Subject: Re: question on ip_conntrack log entries and behavior


On Thu, 20 Mar 2003, [iso-8859-1] Leonardo Rodrigues Magalh=E3es wrote:

>     I got a firewall running kernel 2.4.20 with some p-o-m patches,
> including tcp-window-tracking which allows me change timeout stuff in
> runtime.
>
>     Well ...... my /proc/net/ip_conntrack log is PLENTY of CLOSE
> connections, just like:

This is a bug in 2.4.20. You need the submitted/10_confirm_fix.patch.help
patch from the most recent patch-o-matic.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary



