From: Leonid Veytser <veytser@cs.bu.edu>
Subject: libipq with RAW sockets
Date: Sun, 16 Nov 2003 16:34:27 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.20.0311161628520.17534-100000@csa.bu.edu>
References: <Pine.SOL.4.20.0311071828040.14674-100000@csa.bu.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.20.0311071828040.14674-100000@csa.bu.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

I am using netfilter's libipq to process packets at user space. Then
depending on what packets I recieved, I need to create
"response" packets. I need to construct all the headers myself, so I
decided to user SOCK_RAW sockets. 

But, whenever I open a raw socket: 
  sock = socket(AF_INET,SOCK_RAW,255)
I get the following error from libipq:
  Failed to receive netlink message: Bad address

Is it that I can't use raw sockets together with netlink sockets?
If that is the case, what else can I do to create my own packets with all
headers?

Thanks.


