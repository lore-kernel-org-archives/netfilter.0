From: Blizzards <blizzards@libero.it>
Subject: Re: bandwidth
Date: Fri, 13 Dec 2002 08:24:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF98B3D.5010104@libero.it>
References: <000001c2a212$a0f05050$0401000a@robbysan.org>
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
To: Rob Sterenborg <rsterenborg@xs4all.nl>
Cc: netfilter@lists.netfilter.org

Rob Sterenborg wrote:

>>There are a couple of situations where I need to limit 
>>bandwidth on some of my machines. Can anyone share some 
>>solutions they have used? Here are a couple of examples of 
>>    
>>
>
>HTB with iproute2 tc utility.
>http://luxik.cdi.cz/~devik/qos/htb/ 
>
>Works just fine, easy to configure.
>
>
>Rob
>
>
>
>  
>
You can use iptables USER SPACE with SHAPERED.
http://webs.sinectis.com.ar/lesanti/shaperd.

Bye.
G.



