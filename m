From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: bridge + nat
Date: Mon, 19 Jul 2004 10:25:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407191025.44076.Antony@Soft-Solutions.co.uk>
References: <3063e5040718224645349687@mail.gmail.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3063e5040718224645349687@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Monday 19 July 2004 6:46 am, George Alexandru Dragoi wrote:

> Hello, i am trying to make a linux machine as both router and bridge.

How many NICs do you have in the machine?

So long as you are bridging between some group of NICs, and then routing 
between the bridge group and the other NICs, then you should be able to 
simply set up routing, netfilter etc using device name br0 for the bridge.

You cannot do bridging and routing on the same group of NICs.

Hope this helps,

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


