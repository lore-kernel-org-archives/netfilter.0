From: =?UTF-8?B?0JvQvtC20LXRh9C90LjQuiDQkNC70LXQutGB0LDQvdC00YA=?=
	<A.Logechnik@itak.ua>
Subject: Re: Differentiating direct, and redirected access?
Date: Mon, 18 Oct 2004 18:18:21 +0000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <417408ED.5070406@itak.ua>
References: <D5C9032B2B09C64EA2409D6214E91AC9C05825@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC9C05825@asimail2.alphanumeric.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jason Opperisano wrote:

>>-t nat -A PREROUTING -i eth0 -d ! $INT_ROUTER_IP -p tcp --dport 80 -j
>>REDIRECT --to-ports 3128
>>-A INPUT -i eth0 -d $INT_ROUTER_IP -p tcp --dport 3128 -J REJECT
>>
>>TCP SYN have external ip dst_ip.
>>    
>>
>
>the TCP SYN to port 80 has the dst IP of the web server on the internet.
>
>the redirected packet to TCP port 3128 has the dst IP of the redirected
>interface (eth0 in this case).
>
>your suggested REJECT rule will reject all redirected traffic to port
>3128, and is essentially the issue the OP had already run into, and was
>asking for a work-around.
>
>-j
>
Hmm. Your right. So, fw-mark is great idea.

 
wbr, Logechnik Alexandr

In God we trust, but something 
else must have X.509 certificate


