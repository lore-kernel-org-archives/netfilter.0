From: "Nathan Cassano" <nathan@cjhunter.com>
Subject: What ICMP packets does state RELATED allow?
Date: Wed, 5 Jun 2002 15:07:20 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <012801c20cdd$5cb24d50$2925ae3f@amos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org


Hi NetFilter Gurus,
	I have heard that ip_conntrack will allow ICMP packets pass that
are related to an existing connection. My question is what specific
related ICMP packets does conntrack allow for a given connection? Does
it allow Source Quench (--icmp-type 4) or Redirects (--icmp-type 5)? 


