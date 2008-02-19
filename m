From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: problems deleting conntrack entries with conntrack-tools 0.9.5
Date: Tue, 19 Feb 2008 01:32:06 +0100
Message-ID: <47BA2386.6000803@netfilter.org>
References: <1203363346.5741.11.camel@venus.iportalmais.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1203363346.5741.11.camel@venus.iportalmais.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ricardo Teixeira <rteixeira@iportalmais.pt>
Cc: netfilter@vger.kernel.org

Ricardo Teixeira wrote:
> i am having problems using conntrack-tools to delete entries.
> 
> i am using the command "conntrack -D conntrack -s 192.168.69.24 -p tcp
> --sport 51266 --dport 22", among others, to try to get it to work.
> Though no matter how i try i always get this message : "Operation
> failed: such conntrack doesn't exist"

You seem to have forgotten the destination address (-d) which is
required. However, you have found a bug in the tool since it should
complain about this wrong use.

I'm also planning to improve the tool by reducing the number of
parameters required to destroy entries, I have a patch here but it will
take me some time until I finish it.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
