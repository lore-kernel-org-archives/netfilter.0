From: utteerna <utteerna@gmail.com>
Subject: Re: Small doubt from a newbie :)
Date: Tue, 14 Nov 2006 09:52:30 +0530
Message-ID: <45594486.9010304@gmail.com>
References: <45504519.3070907@gmail.com>
	<BAY103-DAV5241D586B5D06014EBF3FB2F20@phx.gbl>
	<4551C53D.6020306@gmail.com>
	<BAY103-DAV23E7F7CB054F62AA05D7BB2F00@phx.gbl>
	<45543A8E.7070606@gmail.com>
	<BAY103-DAV16BF505A53F02FE4107FF9B2F70@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-DAV16BF505A53F02FE4107FF9B2F70@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marco Berizzi <pupilla@hotmail.com>
Cc: netfilter@lists.netfilter.org

Working finally :) :) :).
Thank you Marco for your time and patience for helping me out. I really 
appreciate it :).

Marco Berizzi wrote:
> utteerna wrote:
>
>   
>> 3)Downloaded patch-o-matic-ng-20061108.tar and put it in /usr/src dir
>> and untarred it
>>     
>
> You don't need POM.
>
>   
>> ---QUESTION-->> Do i have to compile them in to the kernel rather than
>> compiling them as modules???
>>     
>
> There is no difference. If you compile as a module
> you must load it before use. Nothing else.
>
>   
>> 8) cd /usr/src/iptables-1.3.6
>> [/usr/src/iptables-1.3.6]# make clean
>> [/usr/src/iptables-1.3.6]#make
>>     
>
> Nope! You must run 'make KERNEL_DIR=/usr/src/linux-2.6.18.2'
>
>   
>> [/usr/src/iptables-1.3.6]#make install
>>     
>
> Nope! You must run 'make install KERNEL_DIR=/usr/src/linux-2.6.18.2'
>
>
>
>   

