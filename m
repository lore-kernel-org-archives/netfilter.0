From: "hare ram" <hareram@sol.net.in>
Subject: Re: how to use ipt_limit.o?
Date: Mon, 9 Dec 2002 11:59:31 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <041601c29f4c$571f5fc0$13fcc5cb@nextto>
References: <000d01c29f26$0c4f9170$9801010a@winxp>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Peter <chenlf@cibn.com>, netfilter@lists.netfilter.org

Did you Patched the Kernel with POM
if not read netfiter.org p-o-m

hare
----- Original Message -----
From: "Peter" <chenlf@cibn.com>
To: <netfilter@lists.netfilter.org>
Sent: Monday, December 09, 2002 7:25 AM
Subject: how to use ipt_limit.o?


> i am using redhat73 kernel 2.4.18-18.7
> i want to limit number of httpd access per/client
> i use
> # insmod  ipt_limit.o
> # iptables -A INPUT -p tcp --syn --dport http -m iplimit --iplimit-above
4 -j REJECT
> then i get error:
> iptables: No chain/target/match by that name
> who can help me


