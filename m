From: "Fadel" <fadel@siteplanet.com.br>
Subject: blocking kazaa
Date: Tue, 19 Nov 2002 13:11:15 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211191503.gAJF37aL014830@plutao.siteplanet.com.br>
Reply-To: "Fadel" <fadel@siteplanet.com.br>
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

Hi there,

I got a trouble in my network while trying to block Kazaa.
I tried to drop port 1214 with this rule:

iptables -A FORWARD --dport 1214 -j DROP

but this doesn't work. so I did sniffing to see what kind of packets and
ports kazaa uses and I saw that it searches for servers in different ports.
later, I read in various texts around the net, but all recommend to block
port 1214 and kazaa site. this probably worked in version 1.

how could I block kazaa, since I need accept connections in high ports?

sorry for the bad english.

regards,

phadell
-------------------------------------------------
Esta mensagem foi enviada
por Siteplanet WebMail.


