From: Pekka.Panula@sofor.fi
Subject: Reverse NAT needed
Date: Thu, 26 Jun 2003 10:53:22 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF9EE2ED1A.8395FF24-ONC2256D51.002A875E-C2256D51.002C6891@Sofor.fi>
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
To: netfilter@lists.netfilter.org





Hi

My problem is that i need to change source address of packet when it's
incoming to interface and then change destination address when packet it
outgoing from interface. eg. DNAT in POSTROUTING and SNAT in PREROUTING.
Any ideas/help how to do that kind of nat?

I need this because i am using IIOP-protocol and it seems IIOP-packets
includes IP-address of machine and it's not working when server is under
NAT (using private-IP) so i need to do this NAT translation in our network
also so our machine can communicate with IIOP-server.

Terveisin/Regards,
   Pekka Panula, Net Servant Oy - A Sofor company
   pekka.panula@sofor.fi


