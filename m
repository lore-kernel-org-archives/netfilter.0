From: ming fu <fming@borderware.com>
Subject: Re: IPSec Transport Mode
Date: Fri, 09 Jul 2004 12:51:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40EECD07.1090009@borderware.com>
References: <1089207305.788.14.camel@PCA-ARNSTR.ee-consultants.de>	 <200407071453.49223.Antony@Soft-Solutions.co.uk>	 <1089210110.788.27.camel@PCA-ARNSTR.ee-consultants.de>	 <200407072154.52923.Antony@Soft-Solutions.co.uk>	 <1089387536.4237.20.camel@PCA-ARNSTR.ee-consultants.de>	 <1089389598.2111.33.camel@anduril.intranet.cartel-securite.net> <1089390320.4237.29.camel@PCA-ARNSTR.ee-consultants.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089390320.4237.29.camel@PCA-ARNSTR.ee-consultants.de>
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
To: Rainer Arnst <Rainer.Arnst@ee-consultants.de>
Cc: NetFilter Mailling List <netfilter@lists.netfilter.org>

Rainer Arnst wrote:

>>When you do NAT, you alter IP source and/or destination. But TCP
>>checksum includes IP addresses, which means you have to recompute it on
>>the fly when NATing. Anf for it is ciphered, you can't.
>>    
>>
>
>Unfortuneately I have to find a way to make the transport mode work; we
>were using NAT-T, which worked fine, but now I am looking for another
>solution which does not require the VPN Gateway to support NAT-T.
>  
>
If you are using NAT-T for outbound IPSEC connections, open udp port 500 
and 4500 and source nat them. Just do not load any "smart VPN proxy" 
that would alter other parts of the UDP, the simplest udp NAT will do 
the trick.

>Greetings,
>Rainer
>
>  
>


