From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: NAT, MANGLE, and TOS
Date: Thu, 23 Oct 2003 15:01:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F982574.10001@Loudoun-Fairfax.com>
References: <7C9884991ADAE0479C14F10C858BCDF52E3766@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF52E3766@alderaan.smgtec.com>
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
To: nf <netfilter@lists.netfilter.org>

Daniel Chemko wrote:

>>$iptables -t mangle -A OUTPUT -p tcp -m state --state 
>>NEW,RELATED,ESTABLISHED -m tcp --sport 80 -j TOS --set-tos 0x08
>>    
>>
>
>You probably want this on the FORWARD chain to boost the performance of
>your actual client machines instead of just the firewall.
>
>
>  
>
Good point. Is there any reason I shouldn't put my rules on the mangle 
POSTROUTING table and kill 2 birds with one rule?


