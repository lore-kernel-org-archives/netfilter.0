From: "Dr. Lawrence J. Schmitt" <lschmitt@cbu.edu>
Subject: How to setup netfilter to stop outbound DHCP?
Date: Sun, 29 Feb 2004 13:54:29 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c3fefd$daf70a70$6401a8c0@LSchmitt>
References: <20040229143928.7884.68000.Mailman@netfilter-sponsored-by.noris.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040229143928.7884.68000.Mailman@netfilter-sponsored-by.noris.net>
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


I am setting up a lab for students to configure and experiment with
Linux.  I need to set up something that will keep responses to DHCP
requests from leaving the lab to keep from driving the network support
people crazy.  
	1.  What is the appropriate tool to use?
	2.  Can anyone suggest an iptables rule that will block either
dhcp 		requests from entering the lab subnet or responses from
exiting.
	3.  I would like to set up one pc running Linux as a router and
firewall, filter that also would run DHCP and DNS for the local
lab as well as block responses to DHCP requests on the nic that
is connected to the campus network.

Any thoughts or comments are appreciated.

Thanks in advance,

Larry Schmitt





