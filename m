From: James Morris <jmorris@intercode.com.au>
Subject: Re: hook function in  NF_IP_LOCAL_IN does not interruptible_sleep_on?
Date: Mon, 16 Sep 2002 13:18:12 +1000 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Mutt.LNX.4.44.0209161316070.24848-100000@blackbird.intercode.com.au>
References: <Pine.GSO.3.94K.1020915200933.12847A-100000@bora.dacom.co.kr>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.3.94K.1020915200933.12847A-100000@bora.dacom.co.kr>
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
To: Kim Jong Tae <dejavu@bora.dacom.co.kr>
Cc: netfilter@lists.netfilter.org

On Sun, 15 Sep 2002, Kim Jong Tae wrote:

> 
> Why this happens?

You can't sleep in interrupt context.

> If it is impossible, is there another methods to communicate user process?

Have you looked at the ip_queue module?  It uses asynchronous techniques.


- James
-- 
James Morris
<jmorris@intercode.com.au>



