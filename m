From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirect mirrored traffic to userspace app. [RESOLVED]
Date: Thu, 21 Oct 2010 13:03:16 -0500
Message-ID: <4CC08064.7040601@riverviewtech.net>
References: <AANLkTikQLQ4J0+8-Ao5viwjQ4b4YCUDvuez3mKcf2EF7@mail.gmail.com> <alpine.LNX.2.01.1010211941210.22599@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1010211941210.22599@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/21/10 12:41, Jan Engelhardt wrote:
> It still looks wrong though. When using TEE, no expensive promiscous 
> mode is required, nor are static ARP entries.

It was my (mis)understanding that the OP couldn't (for what ever reason) 
make any changes to the production box.

So, I agree that TEE would have worked, but it just didn't fit in the 
paradigm that the OP was working with in.  (File it away for later though.)



Grant. . . .
