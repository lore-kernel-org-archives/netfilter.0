From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: How to stop the flood?
Date: Sun, 01 May 2005 02:59:56 +0200
Message-ID: <42742A0C.5040808@danbbs.dk>
References: <20050428154656.AA0188EDCEB@smtp.sterenborg.info>	<1114703659.6fb8089c0e877@webmail.harrisonburg.k12.va.us>	<035101c54c15$2edb10e0$3b3429c4@rp>
	<4271A606.9090504@riverviewtech.net>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4271A606.9090504@riverviewtech.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

Taylor, Grant wrote:
> Rikunj wrote:
> 
>> Moreover they change the attacking src and dst ports making it hard to
>> pinpoint them.
> 
> Do they change the source and / destination ports or IP addresses?  
> Either way, you should be able to get the DHCP server to log what MAC 
> has what IP address.  As this would be an on going log you could look 
> back and see who had what IP at what time to find the MAC.  With the 
> known MAC of the attacker at any give time you could then look in your 
> log to see what IP is associated with that MAC at present.  Thus you 
> know what IP an attacker has presently, if it has changed from the prior 
> IP.  You could even temporarily block this IP from being able to do any 
> thing on the internet and thus provoking a call from them thus making 
> them stand out in the crowd.

If clients can change IP's on the fly, they can change MAC's all the 
same. Of cause, arranging DHCP on a per-client-based-on-MAC scheme will 
catch this behavior (which you more or less pointed out).

> ...One tip that I can give you would be to have rule like 
> the following:
> 
> iptables -t filter -A FORWARD -p tcp --dport 143
> 
> You would want this rule, with out a jump target (-j...), to act as a 
> counter to see if you do have any traffic like this at all with out 
> interfering with the rest of your firewall.  If you put such rules above 
> any other rules that would effect the FORWARD chain you will get a 
> decent counter.  I would be tempted to modify the rule slightly, as such:
> 
> iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp 
> --dport 143
> 
> This will let you know how much traffic to port 143 (IMAP) Client #1 is 
> sending.

So you chose IMAP merely as an example.. Meaning you'd do similarly for 
other services if interest, right?  Good idea, tnx.

-- 
Kind regards,
Mogens Valentin


