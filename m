From: <sc2@gmx.at>
Subject: Re: Forwarding help
Date: Thu, 27 Nov 2003 13:48:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c3b4e4$b32a8fc0$14d36c50@anonymous>
References: <000701c3b469$17203ba0$14d36c50@anonymous> <200311262230.31909.Antony@Soft-Solutions.co.uk> <002901c3b4d6$ab0bbca0$14d36c50@anonymous> <200311271134.06406.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

so
a.)
>So "iptables -I FORWARD -m state --state >ESTABLISHED,RELATED -j ACCEPT"
might
>be a good idea.
i should include this ?

b.) the port / service is a udp/tcp , port of a half - life game server, so
the clients are not on the same subnet
they are connecting to x.24.51 > and should FW to .24.58:

cya



