From: "__ Radien__" <radien@zworg.com>
Subject: PPTP FWD and/or NAT?
Date: Fri, 21 May 2004 21:12:27 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <29649.1085199147@zworg.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear All

  I just see the pptp_conntrack_nat helper module. I think it should
track the connection that get NATed for PPTP client access to outside

#

               pptp_call
           ---------------->     do NAT   ---------------->
(a client)------------------->[linux-box]------------------->(a vpn
server)

# Figure-1


  So I can just use one client to use vpn access to a server at a time.
  A question here: How about, e.g., using two client to access two
seperated vpn servers on the outside?

The second scenario:
#

               pptp_call
           ---------------->         route         --------------->
(a client)------------------->[routing-linux-box]------------------->(a
vpn server)

# Figure-2


  Let's assume another scenario, If we have some clients with valid_ip
that don't want to get NATed(I just filter in FWD). So what should I
accept in FWD if I want to grant their access to outside using PPTP
protocol, that they will never face any problem? Are there specific
ports to get open? or we should wait for another conntrack helper
module to pass pptp traffic?

at last
 PPTP FWD and/or NAT, which would be better?


