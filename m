From: Kim Jong Tae <dejavu@bora.dacom.co.kr>
Subject: Re: hook function in  NF_IP_LOCAL_IN does not interruptible_sleep_on?
Date: Mon, 16 Sep 2002 09:58:52 +0900 (KST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.3.94K.1020916094553.18116A-100000@bora.dacom.co.kr>
References: <3D84939A.9000005@fugmann.dhs.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D84939A.9000005@fugmann.dhs.org>
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
To: Anders Fugmann <afu@fugmann.dhs.org>
Cc: netfilter@lists.netfilter.org


On Sun, 15 Sep 2002, Anders Fugmann wrote:

>Kim Jong Tae wrote:
>> Hi all.
>> 
>> I  makes hook function, which will communicate with user process
>> for each packet's arrival.
>> First, hook function sends data to user process and user process sends
>> back data. I think that before receiving data from user process, hook
>> function must wait.  hook func's wait is using interruptible_sleep_on.
>> When hook func call interruptible_sleep_on, system hangs!!!
>You are calling sleep in_interrupt. This is not allowed.


  I want to make hook func sleep , Is there any solution to avoid
  problems?

>
>You forgot to mention how you cummunicate with the userspace process. 
>Throgh a device-node?

  I made that communication  which is implemented by
  setsockopts and getsockopts func registered by
  nf_register_sockopt.

  From kernel to user app, getsockopt works well.
  From user app to kernel , setsockopt does not work because  kernel
  does not wait.

  Eventually I want to route incoming packet by using DR (direct routing) 
  technique  according to  anther machine's policy.
   
  It necessary to communicate with another machine's user application.
  It will be implemeted by UDP/ TCP socket code. 


 
>
>Regards
>Anders Fugmann
>
>
>
>
>


