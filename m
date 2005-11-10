From: Hai Wang <u2.ireland@gmail.com>
Subject: Compile issue on kernel 2.4.25
Date: Thu, 10 Nov 2005 11:39:13 -0500
Message-ID: <30be90270511100839o2e13692fmb32ec8194a4d2e2b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello everyone,

      I encountered a problem when I tried to compile iptables-1.3.4
on RH9 (2.4.25), I got the following errors, please shed some lights
on it.

Thanks!

Hai

       ensions/libipt_time_sh.o -c extensions/libipt_time.c
extensions/libipt_time.c: In function `init':
extensions/libipt_time.c:66: structure has no member named `date_start'
extensions/libipt_time.c:67: structure has no member named `date_stop'
extensions/libipt_time.c: In function `parse':
extensions/libipt_time.c:394: structure has no member named `date_start'
extensions/libipt_time.c:407: structure has no member named `date_stop'
extensions/libipt_time.c: In function `print':
extensions/libipt_time.c:489: structure has no member named `date_start'
extensions/libipt_time.c:492: structure has no member named `date_start'
extensions/libipt_time.c:494: structure has no member named `date_stop'
extensions/libipt_time.c:497: structure has no member named `date_stop'
extensions/libipt_time.c: In function `save':
extensions/libipt_time.c:524: structure has no member named `date_start'
extensions/libipt_time.c:525: structure has no member named `date_stop'
make: *** [extensions/libipt_time_sh.o] Error 1

