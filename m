From: =?iso-8859-1?q?Ra=FFfffffal=20Rodr=FFffffedguez?=
	<raul_rodriguez_vasquez@yahoo.es>
Subject: information about nf_register_queue_handler
Date: Thu, 2 Mar 2006 17:59:14 +0100 (CET)
Message-ID: <20060302165914.38686.qmail@web86907.mail.ukl.yahoo.com>
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

Hi guys, i'm writing a netfilter module which must
enqueue packets in different queues and reinject each
one of them according to my decisions... but i have
some doubts....=20

I've registered two hooks (NF_IP_PRE_ROUTING and
NF_IP_POST_ROUTING), but one of them enqueue some
packets (return NF_QUEUE)..... I know at this point,
all queued packets are dropped!, because no-one is
registered to handle queued packets...... and for
register interest in queued packets i must use
nf_register_queue_handler() and
nf_unregister_queue_handler()...=20

I've seen nf_register_queue_handler declarated in
netfilter.h, but i haven't seen it defined nowhere...
please, how must i register some queue_handlers in my
module (one per protocol)? if you know where can i
find information about this, please, let me know
it......... Thanks for help!!!

Raul Rodriguez


=09
=09
	=09
______________________________________________=20
LLama Gratis a cualquier PC del Mundo.=20
Llamadas a fijos y m=F3viles desde 1 c=E9ntimo por minuto.=20
http://es.voice.yahoo.com

