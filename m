From: Mikko Kallio <miki@newweb.oktanet.fi>
Subject: help needed.
Date: Fri, 07 Nov 2003 14:40:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FAB92BA.4090003@newweb.oktanet.fi>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

We have one linux as gateway with multiple static ips (212.23.233.2-60)  
and nat .We also have lan with ip range 192.168.132.0/24.
This works ok, every machine on lan connecting to internet shows up with 
ip 212.23.233.2 (which is our linux), but i'd like to set one of the lan 
machines to use static ip ex. 192.168.132.230 so that it shows with 
212.23.233.40 example and connections from outside to ip 212.23.233.40 
will be natted on 192.168.132.230.
Our linux configuration eth0 212.23.233.2, eth0:0 212.23.233.3, eth0:1 
212.23.233.4 and so on... eth1 is unused, eth2 192.168.132.1 Default gw 
212.23.233.1.

Thanks in advance.

