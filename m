From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: how to log dropped packet
Date: Tue, 28 Sep 2004 09:21:26 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41597366.3010108@pbl.ca>
References: <web-6413785@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-6413785@infinito.it>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hamals@infinito.it wrote:
> 
> hello
> 
> I wrote all my firewall rules, and now I would like to log all packet 
> that will be dropped by my policy rule..
> 
> ..how can I do it?
> 
> what kind of rules do I need?..and where have I to write them?

Use the LOG target.

However, if this is your firewall host toward Internet, are you sure you 
want to log *everything* that is dropped?  There are so many worms and 
automatic scanning tools out there that your logs will get *huge* with 
nothing but crap very fast.  This is especially true for Windows 
specific TCP and UDP ports.  Anything that might be interesting will get 
completely lost in all that noise.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

