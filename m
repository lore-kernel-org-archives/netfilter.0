From: ImpulseFG@netscape.net
Subject: Re: Quick Routing Question
Date: Tue, 04 Mar 2003 16:19:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0383684B.2B9233D9.0256A0D0@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,
   I think I've had this problem. When you try to ping a computer on 10.9.0.254/255.255.225.0 from 172.22.0.0 it sends the requests through the Routing box which changes the sorce IP to 10.9.0.254 and then sends the packet on to the destination computer on the 10.9.0.254/255.255.255.0 network. This packet reaches the computer and then is sent back to 10.9.0.254 and stops. It never goes all the way back to the 172.22.0.0 computer because the computer on 10.9.0.254 thinks the ping came from 10.9.0.254 because of the SNAT translation. 

To fix this problem you will have to do another nat function. DNAT. Someting like $iptables -t nat -A PREROUTING -d 10.9.0.254 -j DNAT --to 172.22.0.0-172.22.0.255 

or you could use -i eth2 instead of -d , I think.

This should get the packet back to the originating computer but then all packets will be routed you won't be able to ping the router form off the network because all the pings will be routed to the network behind it. So it would be better to put a -p scp/udp line in the above command. 

I hope this helps.

                                    -Impulse

__________________________________________________________________
The NEW Netscape 7.0 browser is now available. Upgrade now! http://channels.netscape.com/ns/browsers/download.jsp 

Get your own FREE, personal Netscape Mail account today at http://webmail.netscape.com/

