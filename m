From: Eddahbi Karim <installation_fault_association@yahoo.fr>
Subject: Question about IP_conntrack entry in /proc
Date: Thu, 01 Jan 2004 20:39:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072985943.4290.36.camel@gamux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hiya,

I'm writing a documentation about Iptables and I want to know if the
first src, dst, sport, dport flags are related to the last packet seen
or to the socket ?

Example : tcp      6 431922 ESTABLISHED src=1.2.3.4 dst=5.6.7.8
sport=32827 dport=5190

Does the src/dst/sport/dport flags are related to the whole connection
or just to the last packet seen by the connection tracker ? :)

-- 
--
Eddahbi Karim

Phone :
(33) (0)6 61 30 57 77

France


