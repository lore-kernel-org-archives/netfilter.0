From: Ian Batterbee <ian.batterbee@aut.ac.nz>
Subject: Re: Newbie question about having multiple destination addresses in
 a chain entry
Date: Mon, 06 Jan 2003 01:54:44 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E182B14.6010402@aut.ac.nz>
References: <3E181977.4020204@aut.ac.nz> <20030105124531.GJ16581@miggy.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E181977.4020204@aut.ac.nz>
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
To: Athan <netfilter@miggy.org>
Cc: netfilter@lists.netfilter.org

>
>
>   I *think* your problem is that the NOTHING chain is empty, so at the
>end of it it just returns to the calling chain.  Why not just simply -j
>ACCEPT on the rule in PREROUTING?  That should stop it processing any
>further down the PREROUTING for packets with that destination.
>
>  
>
arghagh! I *KNEW* it would be something simple like that. I don't know 
how I managed to miss the target ACCEPT for so long!

yes.. that does it nicely :) Thanks!




