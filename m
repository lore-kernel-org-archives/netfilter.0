From: Pierre Ossman <drzeus-list@drzeus.cx>
Subject: Re: Out of window filter catches too much
Date: Wed, 02 Mar 2005 09:58:08 +0100
Message-ID: <42258020.9000904@drzeus.cx>
References: <421FBC65.40202@drzeus.cx>
	<Pine.LNX.4.58.0503010938320.14280@blackhole.kfki.hu>
	<42257249.8050101@drzeus.cx>
	<Pine.LNX.4.58.0503020908580.16314@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0503020908580.16314@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Jozsef Kadlecsik wrote:

>On Wed, 2 Mar 2005, Pierre Ossman wrote:
>
>  
>
>>>On Mon, 21 Feb 2005 I posted a patch to netfilter-devel which addresses
>>>this and other issues in TCP window tracking. Please try the patch.
>>>      
>>>
>>I assume you meant:
>>https://lists.netfilter.org/pipermail/netfilter-devel/2005-February/018598.html
>>
>>I've tried the patch and it seems to keep it from dropping the ACKs
>>which is enough to keep the connection going. I still get some errors
>>the other way though:
>>
>>Mar  2 01:36:22 prometheus kernel: ip_ct_tcp: SEQ is over the upper
>>bound (over the window of the receiver) IN= OUT= SRC=10.8.0.24
>>DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 ID=52959 DF PROTO=TCP
>>SPT=1053 DPT=873 SEQ=3991302411 ACK=1391445765 WINDOW=115 RES=0x00 ACK
>>URGP=0 OPT (0101080AD974090C92CE1415)
>>    
>>
>
>If it is reproducible then could you capture the traffic with tcpdump and
>send me the results together with the corresponding log lines? Please dump
>on both sides of the firewall.
>
>  
>
It's a lot of traffic so that will be difficult. The problems appear 
after at least 100 MB has been transfered. Is there some way I can 
reduce this to just the parts that are of relevance to you?
If you have a decent connection (or a lot of time ;)) I suppose I could 
put up the entire thing on the local webserver for you to download at 
your own leisure.

Rgds
Pierrre


