From: Mike McLean <libolt@libolt.net>
Subject: public IP behind NAT system
Date: Thu, 2 Oct 2003 23:20:10 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310022320.10454.libolt@libolt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

I have a situation where I've setup a system that has one public IP and does 
NAT for a network of computers with private IPs.  However I wish to setup a 
couple of machines behind this NAT system with public IPs like the following:


outside router --> NAT system --> other systems with public IPs.

I am wondering if this is possible and feasable with netfilter.  I don't want 
netfilter to NAT any packets sent to the public IPs that aren't on the NAT 
system.

Any help is greatly appreciated,

Mike


