From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: BW Shaping
Date: Sat, 27 Mar 2004 21:24:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403272124.40466.Antony@Soft-Solutions.co.uk>
References: <000c01c414ac$bf717230$0803010a@flora>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000c01c414ac$bf717230$0803010a@flora>
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

On Sunday 28 March 2004 11:06 am, AFShin Abdollahi S. wrote:

> Dear Friends,
> Can iptables Limit Bandwidth by itself ?
> I mean without "tc qdisc" or "htb" ?

You can try building some rules with the -m limit match, but don't expect it 
to be particularly high quality.

Why do you object to using tc?

Antony.

-- 
I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the list;
                                                           please don't CC me.


