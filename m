From: Dag Gruneau <dag@gruneau.com>
Subject: DNAT on POSTROUTING or someother way?
Date: Thu, 3 Apr 2003 00:34:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304030034.17067.dag@gruneau.com>
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

Hello,
I need to hide several identical targets behind a host but have failed
to accomplish this. Hope someone on the list can help me.

The set-up is shown below (good old ASCII drawings). My objectiv
is to set up a testsite where several (more than the shown three)
etherbased targets are to be tested. Each target has a FIXED ip. One target
is attached to one ethernet port on the server. Every target has the same
ip address.

My question: is it possible to access the differnt targets from the
LAN side via ip 10.1.1.11-13. A DNAT in a nat POSTROUTING rule would do
it, but that's not allowed.

Is there any other way to accomplish this?


                 LAN side           Test side  
-----------              Server    
! Client1 !-----!       ----------        -----------
-----------     !       !10.1.1.11/24-----! Target1 !
10.0.0.1/24     !       !        !        -----------
                !       !        !        10.1.1.1/24
                !       !        !
-----------     !       !        !        -----------
! Client2 !-----!-------!10.1.1.12/24-----! Target2 !
-----------     !       !        !        -----------
10.0.0.2/24     !       !        !        10.1.1.1/24
                !       !        !        
                !       !        !        -----------
-----------     !       !10.1.1.13/24-----! Target3 !
! Client3 !-----!       ----------        -----------
-----------       10.0.0.10/24            10.1.1.1/24
10.0.0.3/24

I am running kernel 2.4.19, soon 2.4.20 with iptables 1.2.7a

Thanks in advance
/Dag



