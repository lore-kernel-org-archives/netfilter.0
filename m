From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem with Port forwarding
Date: Mon, 5 Apr 2004 18:54:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404051854.13708.Antony@Soft-Solutions.co.uk>
References: <146373237921.20040405211401@internetplustravel.ru>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <146373237921.20040405211401@internetplustravel.ru>
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

On Monday 05 April 2004 6:14 pm, Oleg Savostyanov wrote:

> I get lost, trying to do a very simple thing...
> My mail server is inside my lan with IP 10.10.10.252
> I need to open port 25 of my mailserver  to the universe
> I made following
> 1)I permit in forward chain packets with dest. port 25
> and
> 2)do DNAT in PREROUTING chain
>
> when I try to telnet to $EXTIP on 25 from outside
> telnet: Unable to connect to remote host: Connection refused

Your FORWARD rule needs to allow the packets to the real IP address 
(10.10.10.252) because the packets have already been translated by the 
PREROUTING rule by the time they get to FORWARD.

Regards,

Antony.

-- 
I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the list;
                                                           please don't CC me.


