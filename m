From: Achim Dreyer <adreyer@math.uni-paderborn.de>
Subject: Re: Problems with my mail server
Date: Thu, 17 Apr 2003 11:54:31 +0200 (MEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304171151280.12747-100000@kepler.uni-paderborn.de>
References: <1050546489.22423.4.camel@alpha.newkirk.us>
Reply-To: adreyer@math.uni-paderborn.de
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1050546489.22423.4.camel@alpha.newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Newkirk <netfilter@newkirk.us>
Cc: netfilter@lists.netfilter.org

On 16 Apr 2003, Joel Newkirk wrote:

> > iptables -A INPUT -p tcp --dport domain -j ACCEPT
> 
> DNS usually runs on udp 53, not tcp.  Also, you probably shoud have udp
> 53 open in OUTPUT as well as INPUT.

.. is is not fully correct. Short dns request are usually sent via udp, 
but if you are expecting to get bigger chunks of dns data (like zone 
transfer requests for the correlation of secondary dns servers!) the tcp 
port is used. Basically all dns servers listen to the udp AND tcp port.



Regards,
Achim Dreyer
--
A. Dreyer, Senior SysAdmin (UNIX&Network) / Internet Security Consultant


