From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: netfilter digest, Vol 1 #1663 - 11 msgs
Date: Tue, 30 Mar 2004 09:02:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403300902.22454.Antony@Soft-Solutions.co.uk>
References: <JFEPKPDIGFAKJOGHOICDCECDCAAA.mani@manikandan.org>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <JFEPKPDIGFAKJOGHOICDCECDCAAA.mani@manikandan.org>
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

On Tuesday 30 March 2004 6:28 am, Manikandan wrote:

> Dear Antony,
>
> Thanks for your reply. I am trying to connect to my Windows 2000 VPN server
> using PPTP. The error 721 is dialup networking error. I have got the
> following modules loaded in my iptables.
>
> iptable_nat            21720   1  (autoclean)
> ipt_state               1048   2  (autoclean)
> ip_conntrack           26976   2  (autoclean) [iptable_nat ipt_state]
> iptable_filter          2412   1  (autoclean)
> ip_tables              15096   5  [iptable_nat ipt_state iptable_filter]
>
> What are the other modules I would need to load?

http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-pptp-conntrack-nat

Please don't post an entire digest when replying to one message.

Regards,

Antony.

-- 
This email was created using 100% recycled electrons.

                                                     Please reply to the list;
                                                           please don't CC me.


