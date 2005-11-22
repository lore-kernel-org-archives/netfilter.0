From: netfilter@rigacci.org
Subject: Re: ip_conntrack_ftp as a module or built-in?
Date: Tue, 22 Nov 2005 12:33:51 +0100
Message-ID: <20051122113351.GA29137@rigacci.org>
References: <20051122104702.GC27443@rigacci.org>
	<54076.193.173.147.3.1132658395.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <54076.193.173.147.3.1132658395.squirrel@webmail.sterenborg.info>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: Rob Sterenborg <rob@sterenborg.info>

> I'm not sure if passing that parameter to the kernel during boot time
> will work (probably not).
> Why would you do that anyway : why not use the module ?

We are developing a network appliance and we are trying to keep a 
small static kernel, with only the required features, no KMOD, no 
discover, hotplug or whatever.

Infact this is a more generic question: a module that accepts 
some paramters can be built into the kernel and still receive all 
of them?

Thanks

-- 
Niccolo Rigacci
Firenze - Italy

