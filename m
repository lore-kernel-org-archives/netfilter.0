From: Stephen Frost <sfrost@snowman.net>
Subject: Re: question on recent module
Date: Sat, 25 Jan 2003 14:21:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030125192149.GP484@ns.snowman.net>
References: <001901c2c3b3$5adfe4a0$3201a8c0@leonardo> <20030125013327.GO484@ns.snowman.net> <005201c2c4a9$f9e7f280$3201a8c0@leonardo>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <005201c2c4a9$f9e7f280$3201a8c0@leonardo>
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
To: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Cc: netfilter ML <netfilter@lists.samba.org>

* Leonardo Rodrigues ( listas ) (leolistas@solucoesip.net) wrote:
> 
> 
>     It's really not clear for me :) Could you give an example rule of how an
> destination address could be checked with recent module in an OUTPUT rule
> for example ? This is my situation ..... i want ALL packets whose
> destination was matched for the last 60 seconds in a recent list called
> 'bullshit'.
> 
> iptables -A OUTPUT -m recent --seconds 60 --name bullshit ??????????????? -j
> DROP

--rdest for the rule above, that's it.  Note that something else needs
to actually populate that table, but I think you've got that figured out
already...

	Stephen

