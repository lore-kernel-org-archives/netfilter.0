From: "phadell" <fadel@siteplanet.com.br>
Subject: ADSL + RADIO
Date: Mon, 26 May 2003 10:40:24 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305261232.h4QCWdOv007668@plutao.siteplanet.com.br>
Reply-To: "phadell" <fadel@siteplanet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"; 
To: "netfilter@lists.netfilter.org"@plutao.siteplanet.com.br

Hello all,

I have a internet server with 2 NICs
eth0 : wireless radio link
eth1 : private network

I added a third NIC on the system to receive a ADSL connection, so
eth2 : ADSL

the problem:
if I start the nics in the sequence eth0,eth1,eth2 -- I can access the
server from outside only through ADSL
if I start the NICs in the sequence eth2,eth1,eth0 -- I can ssh the server
from outside only through RADIO


what I need:
I want 2 internet connections (RADIO + ADSL) and:
ADSL  : only for ssh connections
RADIO : for others applications


What I think that is missing?
I think that is missing some route rule because just one device is making
web connections.
Can someone help me?

thanks in advance.
phadell

-------------------------------------------------
Esta mensagem foi
enviada por Siteplanet WebMail.


