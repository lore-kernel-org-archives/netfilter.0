From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: How to filter Kazaa?
Date: Sat, 27 Sep 2003 09:11:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F758C7A.2090400@Loudoun-Fairfax.com>
References: <3F7468A9.000003.00684@ivan-2yf8n0kwym>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F7468A9.000003.00684@ivan-2yf8n0kwym>
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
To: Ivan <fcovadonga@telecable.es>
Cc: netfilter@lists.netfilter.org

Ivan wrote:

>  
>  Hello there
>  
>   I want to know how to filter Kazaa, my version is Kazaa Lite 2.3
> Can e-mail me at my adress fcovadonga@telecable.es 
> <mailto:fcovadonga@telecable.es>
> or at lightupmylife3@hotmail.com <mailto:lightupmylife3@hotmail.com>
>  
>  Emilio Ivan Fernandez (Spain)
>
> 	
> 	
>
Hi Ivan

Kazaalite uses udp port 1214 to make connection by default although 
users can change that to other ports. Once connected, Kazaalite clients 
will start making connections from --sport 1024  to random --dports 
 >1024. It will then start another connection from --sport 1025, 1026, 
etc. until it's reached it's max connection count. The key to blocking 
it is stopping udp 1214 and the key to making it work (reliably) is to 
not filter anything above port 1024.

Jeff


