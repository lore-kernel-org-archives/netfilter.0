From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: logging -- a newbie question
Date: Fri, 07 May 2004 09:20:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409B9B48.5030706@pbl.ca>
References: <20040507133419.GA32666@bofh.rus.uni-stuttgart.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040507133419.GA32666@bofh.rus.uni-stuttgart.de>
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
To: netfilter@lists.netfilter.org

Pawel Mueller wrote:
> Hi folks,
> 
> I'm a newbie to netfilter and have a short question:
> Where can I see which packages has been DROPPED and which not? I
> remember that I once read something about /proc/net/??, but I can't find
> there what I'm searching for. Can u help please?

You need to use LOG target.  LOG target is non terminating (Netfilter
will continue matching rules from the chain).

Exactly where and how you will use it, depends on how you have
configured your firewall.  As rule of thumb, for each DROP target put
exactly the same rule with LOG target just before it.  For each chain
with DROP policy put log-all rule at the very end of the chain.

So you would have something like this wherever you have DROP target:

   - A INPUT --dport 80 -j LOG --prefix "kill http "
   - A INPUT --dport 80 -j DROP

And something like this wherever you set default policy to DROP, as the
*last* rule in the chain (and make sure you *never* insert any ACCEPT
rules after it, for the obvious reason):

   - A INPUT -j LOG --prefix "dropped in input "

Change the prefixes to whatever you want to appear in your log files.
This will be logged by the kernel, so it will apear wherever your kernel
logs go.

Note that with rules like this, any Joe Cracker can quickly fill your
disk, just by bombarding you with packets that your firewall is dropping
(and logging).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7


