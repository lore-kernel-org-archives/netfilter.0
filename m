From: "Meerz 70" <meerz70@hotmail.com>
Subject: Foolish Question II
Date: Sun, 16 Nov 2003 20:30:14 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law9-F74p59VUEWPg880000f418@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello List,
I was using RH 7.3 with squid as proxy server in my ISP.I implemented 
Ipchains, but it was giving problem. My users were able to use http port but 
wont get access to other ports.
Than I upgraded to RH 8.2 with IPtables instead of IP chains.I dont know how 
to configure IPtables for squid.Please help in this regard.

My Ipchains were

:input ACCEPT
:output ACCEPT
:forward ACCEPT
-A input -p tcp -s 0/0 -d 0/0 80 -j REDIRECT 8080
-A input -p tcp -s 0/0 -d 63.100.206.240/255.255.255.240 80 -j ACCEPT

Thankx in advance

Regards

Shahnawaz

_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*. 
http://join.msn.com/?page=features/virus


