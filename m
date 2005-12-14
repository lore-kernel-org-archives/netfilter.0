From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: opening port for SSH
Date: Wed, 14 Dec 2005 18:28:15 +0100
Message-ID: <000001c600d3$c48640b0$0101000a@sterenborg.info>
References: <dnpfmc$5ee$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dnpfmc$5ee$1@sea.gmane.org>
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
To: netfilter@lists.netfilter.org

> But some questions I have here:
>
> What's the benefif of preferring
>     either "--dport ssh"
>     or     "--dport 22"?

It's the same. Look in /etc/services for service-names you can use.
You can use the notation that you prefer.

> And, what's the means for "bindind the ssh server to a higher port"?

A "higher port" means a portnumber somewhere above 1024.
Normally ssh binds to port 22/tcp (see above). In sshd_config you can
tell it to bind to 49152 or something.


Gr,
Rob


