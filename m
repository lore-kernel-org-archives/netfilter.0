From: "Farshad" <farshadas@excite.com>
Subject: > netfilter and packet manipulation
Date: Wed, 26 Mar 2003 13:55:31 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030326185531.91568299A3@xmxpita.excite.com>
Reply-To: farshadas@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: netfilter@lists.netfilter.org


Hello,

I need to choose a tool for packet manipulation. So I wonder if you could give me your comments on the below issues:

- How do you compare Netfilter to Divert Sockets and Netlink?
(other than what Divert Sockets mini-HOWTO says)
Two factors are important for me: the below question and the
efficency of communication between user and kernel space
(doing packet processing in user space)

- (just to make sure) Using Netfilter, is it possible to capture a packet on its way to another host while it is being routed, send it to the user space, then create a number of packets (e.g. two packets) in user space, and send them down into the kernel instead of the original packet towards the destination of the original packet?

thanks very much,
Farshad


_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!

