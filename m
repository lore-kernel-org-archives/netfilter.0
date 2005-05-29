From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: How to filter OUTPUT chain ala Zonealarm
Date: Sun, 29 May 2005 17:29:53 +0200
Message-ID: <20050529152833.E13A28EDCEB@smtp.sterenborg.info>
References: <4299DD5B.4050705@mindspring.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4299DD5B.4050705@mindspring.com>
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
To: 'Netfilter' <netfilter@lists.netfilter.org>

> The nice feature of Zonealarm for Windows is it will check
> outgoing packets and ask if you want to allow a specific _program_ to
> access the web. 
> 
> In addition, it will warn if a program is asking for server rights.
> 
> This would be a nice feature.
> Is there any way to do this in Iptables?

Well, something like that. Check the Netfilter website ->
Patch-O-Matic-NG -> Extra repository.
You need the owner patch and the sup-gid patch. It's not really the same
as in Windows (e.g. it won't give you popups) but you can do some owner
matching.

> If so could you outline how it would be done and I'll play
> with it on my firewall script.

See examples. Don't know if it'll fit your needs.


Gr,
Rob


