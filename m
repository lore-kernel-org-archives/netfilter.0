From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: Multiple matches and others
Date: Mon, 31 May 2004 11:11:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040531091116.GY26731@home.manuelm.org>
References: <02c901c446ed$7237a7a0$0100a8c0@newlife>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <02c901c446ed$7237a7a0$0100a8c0@newlife>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* Ming-Ching Tiew <mingching.tiew@redtone.com> 31. May 04:
> I am try to figure out what is the meaning of multiple match
> like this :-
> 
>    iptables ......     -m state --state NEW -m mark --mark 1
> 
> is it a boolean AND of two conditions

Yes.

> or is it a boolean OR ?

No.

> If it is boolean AND, does it mean, 
> 
>    iptables ..... -m mark --mark 1 -m state --state NEW ....
> 
> this is the same as the first  ?

Yes.

> Similarly I have problem with multiple states comma together, eg :-
> 
>   iptables ....  -m state --state NEW,INVALID ......
> 
> Does it mean state NEW --and-- INVALID

No.

> or  NEW --or-- INVALID ?

Yes.

HTH,
 regards, Frank.
-- 
Sigmentation fault

