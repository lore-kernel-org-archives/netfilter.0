From: Zander <zander@subatomic.org.uk>
Subject: Re: top level rules
Date: Mon, 12 May 2003 14:08:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <C3C101B6-847A-11D7-8A1C-00039368A90E@subatomic.org.uk>
References: <ABEKJILKOKKGGDJKHKDFEEAICBAA.patrick@vikus.com>
Mime-Version: 1.0 (Apple Message framework v552)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick Ahler <patrick@vikus.com>
Cc: netfilter EMAIL <netfilter@lists.netfilter.org>


On Monday, May 12, 2003, at 13:25 Europe/London, Patrick Ahler wrote:

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
> Thanks,
> -Patrick

/sbin/iptables -I <table> 1........

you can substitute the number for any position in the table: 2, 3 4 etc 
etc.

cheers

Zander


