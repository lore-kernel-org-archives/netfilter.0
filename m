From: Emmanuel Guiton <emmanuel@netlab.hut.fi>
Subject: iptables.o: couldn't find the kernel version the module was compiled
 for
Date: Wed, 12 Nov 2003 12:03:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FB20557.9010403@netlab.hut.fi>
Reply-To: emmanuel@netlab.hut.fi
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hei!

I have a Debian with a kernel 2.4.22. I tried to install iptables1.9 but 
I get the following error when tying to load the module into the kernel:
iptables.o: couldn't find the kernel version the module was compiled for

With Google, I found an indication saying that I could be related to an 
install of ipchains due to my distribution. It was indeed installed, but 
after removing it I still get the same problem.

Any suggestion?

Thanks,

             Emmanuel


