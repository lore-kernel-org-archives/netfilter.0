From: "Ken Hilliard" <ken@acotec.com>
Subject: original destination IP address
Date: Wed, 27 Apr 2005 06:21:26 +0700
Message-ID: <000001c54ab6$b0539c60$2201a8c0@compaq>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

When using the REDIRECT target (e.g., doing transparent web proxying)
the packet's destination IP address is mangled to 127.0.0.0. When using
proxy web servers like Apache or Squid do they automatically retrieve
the original destination IP address? For HTTP v1.1 the host is included
in the request header so the proxy does not strictly need it. But HTTP
v1.0 does not contain the host name/IP address. I've read there is a
netfilter version of the getsockopt function. Do they use this or some
other mechanism?
 
                                                            Thx, Ken
