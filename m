From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: rules for ssh
Date: Sun, 20 Jul 2003 11:09:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007001c34e9e$8ecd14b0$0401000a@sterenborg.info>
References: <000e01c34e15$cb10a010$8101a8c0@tani>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000e01c34e15$cb10a010$8101a8c0@tani>
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

> Is there any other rule to allow ssh from an internal network 
> to the server.
> 
> till now i have used a rule like this:
> 
> $iptables -A tcp-packets -p TCP -s xxx.xxx.xxx.xxx -allowed

I guess this rule is not working, worse : it should generate an error as
I don't think "-allowed" will be recognized.
And if it would work then it would open all tcp services, not just ssh.

Let's say your internal network is 192.168.1.0/24. Try this :
(You can subtitute INPUT for tcp-packets if you like.)
$iptables -A INPUT -s 192.168.1.0/24 -p tcp --dport 22 -j ACCEPT


Gr,
Rob


