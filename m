From: <skmail@mcewen.wcnet.org>
Subject: Re: Forward rule can't specify destination address?
Date: Thu, 6 Jun 2002 16:36:49 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206061629110.24520-100000@mcewen.wcnet.org>
References: <200206062018.g56KIBA03225@Networker.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206062018.g56KIBA03225@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

I'm NAT'ing it also.  Should have put these in my first email I guess.

$IPTB -A FORWARD -d 1.2.3.4 -p tcp --dport 3389 -j ACCEPT


$IPTB -t nat -A PREROUTING -d 1.2.3.4  -p tcp --dport 3389 -j DNAT 
--to 192.168.0.1

$IPTB -t nat -A POSTROUTING -s 192.168.0.1 -d ! 192.168.0.0/24 -j SNAT 
--to 1.2.3.4


Prerouting before forwarding?  So I need to specify 192.168.0.1 as the 
destination in the forward rule?




