From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: logging and droping bad tcp packets
Date: Mon, 17 Oct 2005 15:44:48 +0200
Message-ID: <34587.6189451248$1129556883@news.gmane.org>
References: <FAC4E024BF776842876169173CE2F013287A@mailbox.vikus.com>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F013287A@mailbox.vikus.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi and thank you for the answer Derick....

I set it as 

Iptables -t mangle -A PREROUTING ..... -j DROP ... I suppose Ill keep the
packages rather far away from the "real" iptables chains that are used for
filtering... critics?

Regards,

Edvin Seferovic 

-----Original Message-----
From: Derick Anderson [mailto:danderson@vikus.com] 
Sent: Montag, 17. Oktober 2005 15:26
To: edvin.seferovic@kolp.at; netfilter@lists.netfilter.org
Subject: RE: logging and droping bad tcp packets

 
> Hi,
> 
>  
> 
> I would like to log and drop bad TCP packets on all my 
> interfaces... but in my eyes it means that I would have to 
> write every rule three times. Is there a way to simplify this 
> or should I really write those rules for every interface.. or 
> can I just enter eth+ in the input chain for all my ethernet 
> interfaces? 
> 
> 
> Thank you in advance
> 
>  
> 
> Regards,
> 
>  
> 
> Edvin Seferovic
> 

Just don't specify an interface and the rule will apply to all of them.
Put the 'bad tcp packets' ruleset at the top of your INPUT/FORWARD chain
(whichever is appropriate) before you start doing your interface
specific rules. For purposes of logging (and are you planning to read
the logs?) you won't be able to make an interface-specific label but
otherwise everything should work fine.

Derick Anderson


