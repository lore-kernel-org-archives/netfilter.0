From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: MAC address and iptables
Date: Sun, 29 Feb 2004 14:14:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402291414.17247.Antony@Soft-Solutions.co.uk>
References: <4041ED0A.9070001@stupar.homelinux.net> <200402291355.16107.Antony@Soft-Solutions.co.uk> <4041F1E4.8020408@stupar.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4041F1E4.8020408@stupar.homelinux.net>
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
To: Netfilter-List <netfilter@lists.netfilter.org>

On Sunday 29 February 2004 2:06 pm, Sasa Stupar wrote:

> Antony Stone pravi:
> >
> >Try something like:
> >
> >iptables -A INPUT -s a.b.c.d -m mac --mac aa:bb:cc:dd:ee:ff -j ACCEPT

> Thanx for the answer. Since I am new to linux and iptables: how do I
> know if mac address matching is compiled or not in the kernel

Try the above command and see whether it is accepted.   If it is, you have the 
required support compiled in or loaded as a module.   If it isn't, you'll get 
an error such as "iptables: No chain/target/match by that name".

> and what is the responsible module?

Sorry, I can't answer that for certain because I don't use modules, however I 
would guess it's called "mac".   Perhaps someone else can confirm/correct 
this.

Regards,

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the list;
                                                           please don't CC me.


