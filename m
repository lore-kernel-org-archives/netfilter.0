From: "Yogesh Talekar (M.T.S.@C.N.C.)" <yogesh@unipune.ernet.in>
Subject: IP-tables with authentication
Date: Fri, 2 May 2003 12:25:32 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0305021201530.924-100000@unipune.ernet.in>
References: <009001c30fc2$8ed01720$6401a8c0@int.thorcom.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009001c30fc2$8ed01720$6401a8c0@int.thorcom.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi

Is this possible ...

I have a IP-tables firewall on a machine "A". I have LDAP database on 
machine "B". And I want all the traffic going out of my firewall(A) to be 
authenticated against this LDAP server(B).

Consider following scenario (network diagram)...

********************************FIGURE********************************

Internet <--> Router (realIP-X.X.X.254) <--> Linux FW (Bridge-No IP) 
					|	
					|
					|
		------------------ switch---------------
		|			|		|
	LDAP Server(X.X.X.100)		|		|
	     			     server-1	    server-2
			(RealIP-X.X.X.10)    	(RealIP-X.X.X.3)
			(FakeIP-192.168.1.X) 	(FakeIP-192.168.2.X
				|
				|
				|
				Intranet

**********************************************************************

The question is, can I keep log and count the traffic per user if he 
(from Intranet) uses any type of service (http,ssh,telnet,ftp) via the 
Linux firewall. And Can I authenticate this user against the LDAP server 
(which has a realIP)

Please advice

--yogesh


