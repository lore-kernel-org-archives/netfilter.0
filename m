From: suresh k <suresh@pisem.net>
Subject: Passing packet to IP layer
Date: Wed, 28 Jan 2004 07:00:52 +0300 (MSK)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401280400.i0S40qEW082694@www3.hotbox.ru>
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
I am capturing packets using netfilters. I am modifying the packets and I want to give 
it "up the linux IP stack" in the kernel. The implementation has to been done as a 
loadable module. I have a problem here, I don't find any kernel exported symbol which 
can be used to send the modified stack up the stack and give it to the IP module. Kindly 
tell me if there is any way to do that. I thought abt compiling the code which I have 
written along with the kernel and use the kernel functions directly, but it is not 
portable. Kindly tell me how to proceed. 
cheers
Suresh

