From: "" <chenggh04@st.lzu.edu.cn>
Subject: Why the network is unreable?
Date: Sun, 05 Nov 2006 20:04:22 +0800
Message-ID: <362728262.14561@st.lzu.edu.cn>
Reply-To: chenggh04@st.lzu.edu.cn
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi:
    My network is like this:
    A(IP:192.168.0.2)          B(IP: 192.168.0.1)(IP:192.168.1.2) 
C(IP:192.168.1.1)
     (netmask:255.255.255.0)     255.255.255.0     255.255.255.0    
255.255.255.0
     (gw: 192.168.0.1)            gw : 192.168.1.1


   B is a machine with 2 network cards .
   At first I enable the /proc/sys/net/ipv4/ip_forward and set the default gw
192.168.1.1.
    Now, A ping B is ok and B ping C is ok. But when A ping C the network is
unreachable.
   I don't know why. Please help me.
   Best wishes.
   Thank you.
                                                 cheng



