From: "Rob" <mrboboo@yahoo.com>
Subject: RE: AW: default policy
Date: Sat, 2 Nov 2002 18:08:24 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NEENJAPFEAIEMGMNIGFLEEAMCEAA.mrboboo@yahoo.com>
References: <20021102110903.MEF292.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021102110903.MEF292.mta03-svc.ntlworld.com@there>
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



>>> > You should never set any default policy other than ACCEPT on
>>> > a nat or mangle table.
>>> >
>>> > I sometimes think it was a bad idea even to make it possible.
>>>
>>> No, I don't think so. It's hard for beginners, yes. But once
>>you understand
>>> what iptables is capable of (compared to other commercial products) you
>>> actually are glad that there is a product giving you control over
>>> everything.
>>> Defining the policies for every chain is such a freedom.
>>
>>Can you think of a situation where it would be a good idea to set
>>a default
>>policy other than ACCEPT for a nat or mangle table ?
>>
>>Antony.
>>
>>--
>>
>>90% of network problems are routing problems.
>>9 of the remaining 10% are routing problems in the other direction.
>>The remaining 1% might be something else, but check the routing anyway.


When someone is learning how to network program and they screw up the code
and they dont want packets to get out of the local lan....hint i am learning
to network program.

Robert W.


