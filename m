From: Charles Duffy <Charles_Duffy@messageone.com>
Subject: Re: NETMAP of destination *after* routing
Date: Thu, 07 Aug 2008 14:22:41 -0500
Message-ID: <g7fi2a$neu$1@ger.gmane.org>
References: <g7da9g$21r$1@ger.gmane.org> <alpine.LNX.1.10.0808061912150.6682@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0808061912150.6682@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Jan Engelhardt wrote:
> On Wednesday 2008-08-06 18:57, Charles Duffy wrote:
>> How do 'yall suggest resolving this? I've played around with
>> xtables-addons somewhat, and am pondering building a target to do
>> translation in the mangle table on a packet-by-packet basis (as my
>> present understanding -- correct or otherwise -- is that
> 
> This is what RAWNAT (in the "RAWNAT" branch of xtables-addons) is
> supposed to do, though I do not claim it being well-tested;
> Manu ran into a few issues I still have not addressed :/

My prime concern with RAWNAT is its chances of being merged, given 
Patrick's concerns about the overhead of adding additional tables; 
otherwise, it looks to be just the tool for the job.

Is the workaround Manu provided (commenting out the skb_make_writable 
call) safe?

