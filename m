From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT and DNS/NTP servers
Date: Sat, 1 May 2004 08:19:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405010819.30079.Antony@Soft-Solutions.co.uk>
References: <409310DE.2020004@isoar.ca>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <409310DE.2020004@isoar.ca>
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

On Saturday 01 May 2004 3:52 am, Andrew E. Mileski wrote:

> I'm observing lost packets when a gateway doing NAT also locally hosts
> a server for DNS or NTP.  I believe this the result of the ambiguous
> conditions that can exist when routing server-to-server packets coming
> into the gateway.

Show us your rules and explain what is ambiguous about them?

> I can avoid it by specifying --to-source ports in a SNAT rule for NTP,

If you are hosting NTP on the machine running netfilter, why would you want a 
SNAT rule?   Show us an example?

> or with DNAT and --to-destination port to force usage of the gateway's
> server (which is likely the best solution).

Why?   What address are the clients sending the packets to (such that they 
need DNATting in order to be handled by the server you're talking about)?

> Is this a known situation for these protocols (and similar)?  Or am I
> barking up the wrong tree?

This does not sound like a familiar problem (either which I have seen myself, 
or heard other people discussing).   I think if we saw a picture of your tree 
we could tell you if it was the wrong one to bark up (ie: show us your 
ruleset and explain what goes wrong with it).

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


