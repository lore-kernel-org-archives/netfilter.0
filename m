From: Subhash Gopinath <subhashg@gmail.com>
Subject: problems calling devinet_ioctl from netfilter i/p hook
Date: Fri, 10 Dec 2004 01:33:58 -0800
Message-ID: <81703d8a041210013334497f0a@mail.gmail.com>
Reply-To: Subhash Gopinath <subhashg@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello all,

I need to set the IP address of an ethernet interface from a netfilter
receive hook function
(in a kernel module)....If I call devinet_ioctl() from the hook
function....The kernel hangs reporting "Bug at skbuff.c:174"
Looks like I cannot call the ioctl from netfilter hooks since they are
called in an ISR...
I tried moving the ioctl call to a tasklet , still I get the same
error...Is there any other solution ?

Thanks,
Subhash

