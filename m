From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: patch-o-matic & compiling it
Date: Wed, 23 Apr 2003 13:08:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E6D65A6EE5AAD6119DE800B0D03DA0C52895C9@MS_LEU1>
References: <3EA668ED.9000405@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EA668ED.9000405@o2.pl>
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

> I have a lame problem here I can't win with.
> I wanted to use one of the features provided by the new path-o-matic, 
> but I have problems compiling them into modules/kernel.
> 
> this is what I did:
> make clean ( in kernel)
> ./runme --batch extra (provided the correct kernel dir it said I can 
> compile the kernel)
> make config(there was no new options from POM)
> make modules
> make modules_install

So, uhhm.. What goes wrong then ?
Which kernel version ? Which pom version ? Any error messages ?


Rob


