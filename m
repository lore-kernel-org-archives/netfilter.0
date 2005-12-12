From: Vinod Chandran <vinod_chandran@multitech.co.in>
Subject: Re: QoS with netfilter
Date: Mon, 12 Dec 2005 11:06:52 +0530
Message-ID: <439D0C74.6050107@multitech.co.in>
References: <bab495710512100453s275d2335l4a92d90d37224c2@mail.gmail.com>	<1134288474.8304.4.camel@anduril.intranet.cartel-securite.net>	<bab495710512110118x7d82bc59l554a45039b75fe23@mail.gmail.com>
	<200512111419.34465.arny@ats.s.bawue.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200512111419.34465.arny@ats.s.bawue.de>
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
To: netfilter@lists.netfilter.org

Hi,

If  you want to know how DSMARK and DSCP is used for QOS, check out the 
following link
http://opalsoft.net/qos/DS-29.htm
However, this doesnt use netfilter.

If you want to use netfilter, I think the best way is to have 
iptablerules in FORWARD, to set mark values on the basis of specific 
conditions,

like --src 192.168.1.0/24 -j MARK --set-mark 1.

This mark value can be further used in tc filter commands..
If this will suffice you,  I can elaborate more on this process.

Regards,
Vinod C



Thilo Schulz wrote:

>On Sunday 11 December 2005 10:18, Erik wrote:
>  
>
>>I have a lot of answers to this but nobody have responded to what I
>>asked.  Please bear with me and help me find out what my problem might
>>*actually* be.
>>    
>>
>
>Sorry you are right.
>
>  
>
>>Have anyone actually used this feature in iptables?
>>    
>>
>
>Yes.
>
>  
>
>>No, I do not need this router to handle these packages with *any* QoS.
>>Other router handle QoS. In fact a lot of router are updated to handle QoS.
>>    
>>
>
>These bits should work nice in theory, but in my experience they offer little 
>to no improvement.
>
>  
>
>>a) confirmation that this feature actually is implemented and should
>>work with the 2.6.12 kernel (or that it is not!)
>>    
>>
>
>It should work, yes.
>
>  
>
>>b) things to verify like patches etc
>>    
>>
>
>No clue.
>
>  
>
>>c) actual commands to test this
>>    
>>
>
>tcpdump -i eth0 -v
> 
>prints out the tos field on all packets traversing the interface eth0.
>
>  
>


