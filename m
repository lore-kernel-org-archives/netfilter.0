From: Michael Stilmant <ml-netfilter@adtech.be>
Subject: RE: transparent tcp proxy
Date: 26 May 2003 10:45:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053938722.17259.6.camel@stilmant>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019241@wardrive.citadelcomputer.com.au>
Reply-To: ml-netfilter@adtech.be
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A019241@wardrive.citadelcomputer.com.au>
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

On Sat, 2003-05-24 at 04:05, George Vieira wrote:
> Hmm. I don't think bridging copies the packets MAC address over. it just copies the packet data with it's source and destination IPs.
> 
> Can I ask what the mac address is used for, or needed for? Is it for some authenticity reasons?

No, I don't need ti used the MAC Address. And actually my 
iptables filter work pretty well. But, with this, 
the MAC address of the source host change for each connection


                     10.0.0.225
                     +--------+
                     |   B    |
   +-----+           |        |          +-----+
   |  A  +-----------[ebtables]----------|  C  |
   +-----+           +--------+          +-----+
   10.0.0.3                             10.0.0.32     


Rappel:
when C send not filtered packet to A, A see the C MAC address with IP
10.0.0.32. when B send filtered TCP/IP packet to A with IP address 
10.0.0.32 A see the B MAC address. This work but it's not acceptable.
the A MAC-IP association table will change setup all the time. 


Michael



