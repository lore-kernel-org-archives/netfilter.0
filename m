From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 09:09:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC4B435.5010805@Loudoun-Fairfax.com>
References: <1069853846.3fc4ac966be15@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069853846.3fc4ac966be15@paris-hme1>
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
To: zynkx <skydive@megamail.pt>
Cc: netfilter@lists.netfilter.org

zynkx wrote:

>yahoo and hotmail ip ranges? does anyone knows this ip 
>ranges? need to allow them in my smtp prerouting 
>rulez  :))
>
>  
>

I don't know the answer and I'd be surprised if anyone else here does. 
You can probably get that info from http://www.iana.org/ but it may be 
easier to contact Yahoo and Hotmail and ask them directly. Out of 
curiosity, why are you filtering smtp in your PREROUTING chain? Are you 
DNATing mail based on the sender's domain?

Jeff



