From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: top level rules
Date: 12 May 2003 14:49:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052743756.1399.0.camel@xbox>
References: <ABEKJILKOKKGGDJKHKDFEEAICBAA.patrick@vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ABEKJILKOKKGGDJKHKDFEEAICBAA.patrick@vikus.com>
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
To: Patrick Ahler <patrick@vikus.com>
Cc: netfilter EMAIL <netfilter@lists.netfilter.org>

On Mon, 2003-05-12 at 14:25, Patrick Ahler wrote:
> Is there any way to insert a new rule at the top of a table...
> 
> For instance, I have rules...
> 
> RULE 1
> RULE 2
> RULE 3
> RULE 4
> 
> in order... but what if I want to place a rule before rule 1? Is that
> possible?

Yes, just use the -I (insert) option of iptablesinstead of -A (append).

Regards,
Filip


