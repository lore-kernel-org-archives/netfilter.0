From: =?iso-8859-1?Q?Rub=E9n_Cardenal?= <rubenc@arrakis.es>
Subject: Multiple gateways problem
Date: Thu, 31 Mar 2005 18:37:50 +0200
Message-ID: <13036.1135969453$1112287155@news.gmane.org>
References: <20050331133823.6562.qmail@flock1.newmail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050331133823.6562.qmail@flock1.newmail.ru>
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

 
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

  I have a quite simple setup in ony of my servers but I can't make
the conditional routing using iptables to work.

  The server has:

  eth0: 192.168.2.0/23
  eth1/eth2: reserved for future use
  eth3: 10.10.100.0/24

  The eth3 is connected to a separate switch where 30 AP's are
connected to and a dhcp server running on the server gives IP's to
clients connected to the wireless lan. In the same way, eth0 is
connected to another set of switchs (isolated from the switch where
eth3 is connected to) where all LAN clients (192.168.2.0/23) are
connected to.

  I can use two gateways, both of them are accessed via eth0:
192.168.3.250 and 192.16.3.254. The default gateway for all the LAN
clients (192.168.2.0/23) is (and must be) 192.168.3.254 and just a
few people is allowed to use the other gateway.

  The desired configuration is that I want to be able to route
certain clients from eth3 (10.10.100.0/24) via 192.168.3.250 instead
of the default gw of the server (192.168.3.254).

  All the configurations I've tried, doesn't work or make LAN clients
loose connectivity with the server. How should I setup routes/rules?

  Regards,

- - Ruben.

-----BEGIN PGP SIGNATURE-----
Version: PGP 8.1

iQA/AwUBQkwnXQcpyqBKAkY5EQLdOwCg/rIS18MM5mKYfXjEhvSiCPgOV1QAmwZ7
TG3o6vj9sH7NQXoVkgUsBcvS
=BTkL
-----END PGP SIGNATURE-----


