From: "Jesper Lund" <jesper@ballbreaker.dk>
Subject: Re: iptables for spoofing
Date: Fri, 4 Apr 2003 15:46:41 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2493.212.242.51.102.1049464001.squirrel@www.ramstedt.dk>
References: <HCTMC1$Ix9ReBi3coFoqW2avUnEYGRctoNNS_JdXwlN6@bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HCTMC1$Ix9ReBi3coFoqW2avUnEYGRctoNNS_JdXwlN6@bol.com.br>
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
To: julioody@bol.com.br
Cc: netfilter@lists.netfilter.org

> Hello. I'm taking some classes on
> iptables, and I heard it's possible to
> use iptables to spoof outgoing packets
> (or any packet at all).
> So, my question is: How do I do it ?
> How can I alter the source address of
> a given packet using iptables ?
> Thanks in advance.

By using SNAT or MASQUERADE jump target.

//Jesper



