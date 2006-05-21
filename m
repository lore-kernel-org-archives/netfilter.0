From: Frank Abel Cancio Bello <frankabel@tesla.cujae.edu.cu>
Subject: error compiling nfqnl_test.c
Date: Sun, 21 May 2006 15:15:30 -0400
Message-ID: <200605211515.30934.frankabel@tesla.cujae.edu.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=nowsp; d=tesla.cujae.edu.cu;
	s=MDaemon; t=1148238998; x=1148843798;
	i=frankabel@tesla.cujae.edu.cu; q=dns; h=DomainKey-Signature:
	Received:From:Organization:To:Subject:Date:User-Agent:
	MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-Disposition:Message-Id; b=UNEZDhiuNhqLk9Q4A9OrrKlQ1hnsjXm
	nmowXuaWs7vqqqGiFqzyF0B6Sv7IML0XQQ8Gg/dhzAuTMSVz3CAk+1Njjk5gIrg8
	FYYgcrJadIY+N1PMVSrrfDzei3pd88B4Xvw319SseTHTclVKjO0RFqZFjjaQePjC
	ehVZt4iRWKHE=
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi all!

A newbie question:
When I try to compile "nfqnl_test.c" putting on command line:

"gcc -Wall -o nfqnl_test nfqnl_test.c"

the following error occur:

"
/tmp/cc8hh7RL.o: In function `print_pkt':nfqnl_test.c:(.text+0x15): undefin=
ed=20
reference to `nfq_get_msg_packet_hdr'
:nfqnl_test.c:(.text+0x73): undefined reference to `nfq_get_nfmark'
:nfqnl_test.c:(.text+0x9a): undefined reference to `nfq_get_indev'
:nfqnl_test.c:(.text+0xc1): undefined reference to `nfq_get_outdev'
:nfqnl_test.c:(.text+0xef): undefined reference to `nfq_get_payload'
/tmp/cc8hh7RL.o: In function `cb':nfqnl_test.c:(.text+0x173): undefined=20
reference to `nfq_set_verdict'
/tmp/cc8hh7RL.o: In function `main':nfqnl_test.c:(.text+0x1a5): undefined=20
reference to `nfq_open'
:nfqnl_test.c:(.text+0x1fe): undefined reference to `nfq_unbind_pf'
:nfqnl_test.c:(.text+0x252): undefined reference to `nfq_bind_pf'
:nfqnl_test.c:(.text+0x2b6): undefined reference to `nfq_create_queue'
:nfqnl_test.c:(.text+0x317): undefined reference to `nfq_set_mode'
:nfqnl_test.c:(.text+0x357): undefined reference to `nfq_nfnlh'
:nfqnl_test.c:(.text+0x365): undefined reference to `nfnl_fd'
:nfqnl_test.c:(.text+0x392): undefined reference to `nfq_handle_packet'
:nfqnl_test.c:(.text+0x3dd): undefined reference to `nfq_destroy_queue'
:nfqnl_test.c:(.text+0x3f4): undefined reference to `nfq_close'
collect2: ld returned 1 exit status
"

What I must put a command line to compile the "nfqnl_test.c"

Salute
Frank Abel


__________________________________________

XIII Convenci=F3n Cient=EDfica de Ingenier=EDa y Arquitectura
28/noviembre al 1/diciembre de 2006
Cujae, Ciudad de la Habana, Cuba
http://www.cujae.edu.cu/eventos/convencion

