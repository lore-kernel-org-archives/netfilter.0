From: =?iso-8859-1?Q?St=E9phane_Klein?= <sklein@aquitaine-valley.fr>
Subject: sqlnet 8 connexion and iptables 1.2.6a
Date: Fri, 4 Apr 2003 13:05:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <C92390AC8CA2D3119A2800508B6711B401406B14@PHOSOIRAK>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi ,

I'm trying to connect to an oracle 8.1.7 server behind a linux iptables
firewall.
I've opened the 1521/tcp port.
the tnsping response is OK, but when i'm trying to connect with SQLPLUS,
logs tell me SQLPLUS 
try to connect to a random port ( i think oracle server give sqlnet a port
to connect to).

I think sqlnet protocol is similar to ftp protocol. if it is the case, is
there a ip_conntrack_sqlnet module
to solve the problem. 

Could you tell me what to do to make this work?
Thanks,

Stephane

