From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: HELP : How to group IP addresses by refering to them as a single name ?
Date: Fri, 20 Sep 2002 14:11:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920190548.NZUZ16609.mta05-svc.ntlworld.com@there>
References: <20020920124303.17644.qmail@web40209.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020920124303.17644.qmail@web40209.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Friday 20 September 2002 1:43 pm, Alok Shukla wrote:

> HI,
>
> THANKS A LOT..!
>
> I have understood a lot of things. Now just for the
> sake..tell me if the following are valid
>
> iptables -t nat -A POSTROUTING -s 192.168.0.10/27 -d
> any/0 -J MASQUERADE
>
> for allowing all the machines starting from 11 to 41

Unfortunately not.   You have the right idea, but you can't simply choose the 
starting address anywhere you like :-(

The rule is this: the starting address of the block must be a multiple of the 
size of the block.

So if you're creating a block of 64 machines with a /26 netmask, the first 
address of the block must be 0, 64, 128 or 192.

Similarly, if you want a block of 32 machines with a /27 netmask, the first 
address of the block must be 0, 32, 64, 96, 128, 160, 192 or 224.

In yur case you tried to create a block of 32 machines with a starting 
address of 10, which I'm afraid is not allowed :-)


Hope this helps,

Antony.

-- 

Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.


