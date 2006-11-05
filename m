From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Why the network is unreable?
Date: Sun, 5 Nov 2006 19:05:25 +0100
Message-ID: <002901c70104$f8078d90$0101000a@tanjian>
References: <362728262.14561@st.lzu.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <362728262.14561@st.lzu.edu.cn>
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

> Hi:
>     My network is like this:
>     A(IP:192.168.0.2)          B(IP: 192.168.0.1)(IP:192.168.1.2)
>      C(IP:192.168.1.1) (netmask:255.255.255.0)     255.255.255.0    
>      255.255.255.0 255.255.255.0 (gw: 192.168.0.1)            gw :
> 192.168.1.1 

I'm not sure what you mean because of wrapping.
You mean this?

A(IP: 192.168.0.2)
 (NM: 255.255.255.0)
 (GW: 192.168.0.1)

B(IP: 192.168.0.1)   (IP: 192.168.1.2)
 (NM: 255.255.255.0) (NM: 255.255.255.0)

C(IP: 192.168.1.1)
 (NM: 255.255.255.0)
 (GW: 192.168.1.1)

You should change the GW of C into 192.168.1.2.
C does not know the route to 192.168.0.2; B does.

>    B is a machine with 2 network cards .
>    At first I enable the /proc/sys/net/ipv4/ip_forward and
> set the default gw 192.168.1.1.
>     Now, A ping B is ok and B ping C is ok. But when A ping C the
> network is unreachable.
>    I don't know why. Please help me.


Gr,
Rob


