From: Shane Hickey <shane@howsyournetwork.com>
Subject: Re: Need help with rate-limiting NTTP traffic
Date: Thu, 1 Apr 2004 20:20:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040401202054.1fffa4b6@daneel.volumen.net>
References: <20040331165409.0d498074@daneel.volumen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040331165409.0d498074@daneel.volumen.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I found the solution to my exact problem (right down the NNTP client) at
http://mail.gnu.org/archive/html/pan-users/2003-11/msg00009.html

For those who want the answer now with now clicking, you can do it all
with this:

tc qdisc add dev $WANIFACE handle ffff: ingress
tc filter add dev $WANIFACE parent ffff: protocol ip prio 50 u32 match
ip sport 119 0xffff police rate 800kbit burst 15k drop flowid :1

Thanks.

-- 
Shane Hickey <shane@howsyournetwork.com>: Network/System Consultant
GPG KeyID: 777CBF3F
Key fingerprint: 254F B2AC 9939 C715 278C  DA95 4109 9F69 777C BF3F
Listening to: Bill Frisell  - Vernon Reid - Small Hands

