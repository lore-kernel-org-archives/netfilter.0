From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: hook function in  NF_IP_LOCAL_IN does not interruptible_sleep_on?
Date: Sun, 15 Sep 2002 16:05:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D84939A.9000005@fugmann.dhs.org>
References: <Pine.GSO.3.94K.1020915200933.12847A-100000@bora.dacom.co.kr>
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
To: Kim Jong Tae <dejavu@bora.dacom.co.kr>
Cc: netfilter@lists.netfilter.org

Kim Jong Tae wrote:
> Hi all.
> 
> I  makes hook function, which will communicate with user process
> for each packet's arrival.
> First, hook function sends data to user process and user process sends
> back data. I think that before receiving data from user process, hook
> function must wait.  hook func's wait is using interruptible_sleep_on.
> When hook func call interruptible_sleep_on, system hangs!!!
You are calling sleep in_interrupt. This is not allowed.

You forgot to mention how you cummunicate with the userspace process. 
Throgh a device-node?

Regards
Anders Fugmann





