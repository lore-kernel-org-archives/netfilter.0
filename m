From: Steve <netfilter@arntzen.us>
Subject: How to mangle source packet source ports to a fixed range
Date: Fri, 9 Feb 2007 09:15:56 -0600
Message-ID: <200702090915.56546.netfilter@arntzen.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

I have a need to set the source packet's high (unprivileged) source ports to a 
fixed range of high  ports on a firewall providing NAT.

The goal is to be able to identify the inside machines at the destination 
after NAT has changed the addresses.  This is for identification only.  I do 
not need to connect back to the machines inside the firewall.  I realize this 
may break certain protocols which may use dedicated unprivileged ports.

i.e.:

PREROUTING -i eth0 -p tcp -m tcp -s 192.168.0.x  --sport 1024:65535 -j 
REDIRECT --to-ports 2000-2200

The above modifies the destination port based on the source port.  I wish to 
modify the source port (  --from-ports ? ).

By already knowing the range of high ports used per internal IP address, I can 
tell which machine inside is sending the data.

If someone knows another way of doing this, I would appreciate any 
suggestions.

Thanks,

Steve.

