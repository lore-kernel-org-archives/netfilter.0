From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FW: PPTP clients behind iptables firewall.
Date: Tue, 30 Mar 2004 15:16:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403301516.27786.Antony@Soft-Solutions.co.uk>
References: <JFEPKPDIGFAKJOGHOICDEECGCAAA.mani@manikandan.org>
Reply-To: "Netfilter" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <JFEPKPDIGFAKJOGHOICDEECGCAAA.mani@manikandan.org>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Tuesday 30 March 2004 3:03 pm, Manikandan wrote:

> Dear all,
>
> 	I am running RedHat Linux 9 with kernel 2.4.20-8, with iptables
> iptables-1.2.7a-2, which acts as a gateway/firewall for my LAN
> 10.35.57.0/24.
>
> 	I do  SNAT to one public IP in my firewall to allow traffic from LAN
> to Internet.
>
> 	My LAN PPTP clients are not able to establish more than one
> connection at a time to my VPN server (Internet).
>
> 		Please assist me in resolving this issue.

http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-pptp-conntrack-nat

Regards,

Antony.

-- 
I don't know, maybe if we all waited then cosmic rays would write all our 
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the list;
                                                           please don't CC me.


