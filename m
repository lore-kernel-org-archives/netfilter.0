From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is this config OK, plus where should I be logging...
Date: Mon, 5 Apr 2004 14:34:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404051434.04761.Antony@Soft-Solutions.co.uk>
References: <000001c41ad1$692d25b0$0464a8c0@stu> <200404051011.16437.Antony@Soft-Solutions.co.uk> <200404050914.19563.Alistair Tonner <>>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <>
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

On Monday 05 April 2004 2:14 pm, Alistair Tonner, the man with no email 
address, wrote:

> 	(on an aside Antony ... what value do you see in a smoll system config of
> breaking the traffic down into user chains based on direction of traffic?
> -- and only using the builtins to get the packets into those user chains?)

I see no benefit in that unless your traffic rules are sufficiently complex to 
make them easier to understand if you break them down into multiple user 
chains (and for what I think you described as a "small system", you wouldn't 
have that complexity).

Most systems below an unreasonable level of complication have rules which fall 
into the following categories:

1. Clients on local LAN accessing servers on Internet.
2. Clients on local LAN accessing servers on DMZ.
3. Systems on the Internet accessing servers on DMZ.
4. Servers on DMZ accessing the Internet.
5. Replies to any/all the above.

For the very simplest systems of course you don't even have categories (2), 
(3) or (4).

For most small systems, (1) is very simple - allow everything.
(2) and (4) (for a simple setup) provide the same services, so combined rules 
can be used without bothering about the input interface.
(3) is the area where your level of paranoia determines how complex your rules 
get.
(5) is a single rule on the whole firewall allowing Established / Related 
packets.

Therefore I see no reason not to put the whole lot of the above into a single 
FORWARD chain, with the proviso that rule (5) comes first.

Regards,

Antony.

-- 
I don't know, maybe if we all waited then cosmic rays would write all our 
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the list;
                                                           please don't CC me.


