From: "Raul I. Becette" <raulbecette@unp.edu.ar>
Subject: multiple webservers behind iptables
Date: Wed, 09 Feb 2005 15:24:36 -0300
Message-ID: <420A5564.7020000@unp.edu.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello list

This is my first post.
I am in charge of a LAN connected to internet through a firewall box 
PIII 500MHz with iptables 1.2.10.

There are different internal webservers that I don't adminnister and are 
located physically in different parts of the building.
There is an internal DNS server which I administer to resolve internal 
www queries.

My problem is that from the outside I cannot access those webservers 
when I type www.xxx.unp.edu.ar (xxx being the name of the server).
My net schema is the following


                                     INTERNET
Mail Relay            Main Web Server             Router


-------------------------Firewall--------------------------------


POP Server         Proxy         Webserver1      Webserver2
                                         LAN

My question is how can I use iptables rules to be able to access those 
servers from the outside.

Any info you need just ask

Thank you for your time

-- 


-----------------------------------------------------------------
Raul I. Becette
E-mail: raulbecette@unp.edu.ar
REPAC, Red Patagonica de  Comunicaciones
Univ. Nac. de la Patagonia San Juan Bosco
Ciudad Universitaria - Km.4.
9000 - Comodoro Rivadavia - Chubut
Tel/Fax : (0297) - 4550073
------------------------------------------------------------------


