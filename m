From: "Michael K" <micke@klintan.se>
Subject: RE: where is libipt_match.so?
Date: Thu, 29 May 2003 08:59:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001f01c325af$e14cff10$0200a8c0@klintan.local>
References: <20030529034344.GF33081@justpickone.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030529034344.GF33081@justpickone.org>
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
To: 'David T-G' <davidtg-netfilter@justpickone.org>, 'NetFilter Users' List' <netfilter@lists.netfilter.org>



> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of David T-G
> Sent: Thursday, May 29, 2003 5:44 AM
> To: NetFilter Users' List
> Subject: where is libipt_match.so?
> 
> 
> Hi again, all --
> 
> I have finally gotten my client to rebuild his SCO 
> UnitedLinux machine from scratch to give me a 
> guaranteed-clean base and I tried running my iptables setup 
> script.  Everything (NIC discovery, init script creation,
> etcetc) appears to have gone well but iptables has a problem:
> 
>   ...
>   iptables -t filter -A INPUT -i eth0 -m match 
> NEW,RELATED,ESTABLISHED -j ACCEPT
>   iptables v1.2.7a: Couldn't load match 
> `match':/usr/lib/iptables/libipt_match.so: cannot open shared 
> object file: No such file or directory
> 
> This worked before, but I had also mucked around with the 
> SuSEfirewall2 scripts before; sure enough, it isn't there 
> now.  Where does that file live?  Do I need another RPM, perhaps?
> 
> 
> TIA & HAND
> 

Shouldn't the line read
iptables -t filter -A INPUT -i eth0 -m state --state
NEW,RELATED,ESTABLISHED -j ACCEPT

Did a search in the pom for *match*. Didn't find any.



