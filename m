From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Fw: 1:1 NAT/Not working
Date: Tue, 28 Jan 2003 17:40:00 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0301281738490.7919@dns.toxicfilms.tv>
References: <001601c2c6e7$ba456410$1e01a8c0@win2k.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001601c2c6e7$ba456410$1e01a8c0@win2k.com>
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
To: Mike <mikeeo@msn.com>
Cc: netfilter@lists.netfilter.org

> can anyone give me a hand with this? or do I have to alias the interface?
You have to specify your external intefrace there on both rules:
... -i eth0 ... -j DNAT
... -i eth0 ... -j SNAT

Regards,
Maciej


