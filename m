From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: DNAT problem
Date: Sat, 29 May 2004 18:03:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040529180330.6ec3d567.leslie.polzer@gmx.net>
References: <20040529172536.6df75cca.leslie.polzer@gmx.net>
	<000701c44592$bb254460$0200000a@heretic>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000701c44592$bb254460$0200000a@heretic>
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

On Sat, 29 May 2004 12:36:37 -0300
"Alexis" <alexis@tpys.com.ar> wrote:

> i think it could be
> 
> - that the isp (if you're connecting to one isp trough ppp0) has a filter for
> port 80 (it seems strange)
Hm, possible. I just noticed 81 works, too! What crap is this?

> are you mangling some packets? what is the output for iptables -t mangle -L?
No rules at all, I generally try to stay away from mangling when testing:


### <snip> ###

stronghold:~# iptables -t mangle -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination 

### </snip> ###


So I guess all facts are pointing at my crappy ISP...

Leslie

