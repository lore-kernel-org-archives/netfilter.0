From: Blizzards <blizzards@libero.it>
Subject: Re: hostname forwarding
Date: Thu, 12 Dec 2002 08:16:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF837BA.5000908@libero.it>
References: <Pine.LNX.4.33.0212111606240.17876-100000@www.csbenter.at> <1039671369.4125.12.camel@rayw.knowledgefactory.co.za>
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
To: raymondl@knowledgefactory.co.za
Cc: Patrick Maartense <patrick@patrick.at>, bernard <bernard@gers.net>, Netfilter Mailing List <netfilter@lists.netfilter.org>

The host A and Host B share the same ip address.
In this case -s is no useful because resolving host a and host b return 
the same address, and the 1st match win.
You can use APACHE name virtual host to handle this correctly.

G.

>>
>>    
>>
>Ummm, what is the -s parameter for then?
>iptables -t nat -A PREROUTING -p tcp -s <hostname A> --dport 80 -j
>REDIRECT --to-destination 192.168.1.1:80
>iptables -t nat -A PREROUTING -p tcp -s <hostname B> --dport 80 -j
>REDIRECT --to-destination 192.168.1.2:80
>
>Or am I missing something?
>
>Ray
>  
>



