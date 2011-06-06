From: John Lister <john.lister@kickstone.com>
Subject: Re: [2:656]?
Date: Mon, 06 Jun 2011 20:57:53 +0100
Message-ID: <4DED3141.9030805@kickstone.com>
References: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: bmcdowell@coxhealthplans.com
Cc: netfilter@vger.kernel.org

On 06/06/2011 20:35, bmcdowell@coxhealthplans.com wrote:
> Hello list.  I'm in the process of 'modernizing' my iptables scripts to utilize iptables-save/iptables-restore.  I've imported my script onto a test box, have exported via -save, and now I have a question or two about what I'm seeing. 
>
> For starters, is there a reference for the changes in format?  Google is most unhelpful when trying to search for "[2:656]", for example.
>
> Specifically, I'd like to know what the "2:656" means in the following line:
>
> -----
> *filter
> :INPUT DROP [2:656]
> -----
These are the packet/byte counts for that chain from memory - You can 
simply replace them 0:0 if you are generating scripts and don't care 
about the counts.

John
