From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT not working
Date: Thu, 18 Mar 2004 20:50:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403182050.33327.Antony@Soft-Solutions.co.uk>
References: <000101c40d27$5ce6ed20$0464a8c0@stu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c40d27$5ce6ed20$0464a8c0@stu>
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

On Thursday 18 March 2004 8:26 pm, Stuart Lamble wrote:

> Hello netfilter lists

Hello Stuart.

> iptables -t nat -A PREROUTING -i ppp0 -p tcp -d $FW-EXT-IP --dport 22 -j
> DNAT --to 192.168.100.6:22
>
> Simply put I want to allow ssh from the internet to a server on my LAN,
> 192.168.100.6
> My FORWARD rule is default accept.

Ugh :(   I trust you are going to change that very soon :)

> I understand that a packet comes into the firewall on an interface and
> then gets PREROUTED as above the gets passed to FORWARD = accept then to
> the destination???

Yes, that is the correct mechanism.

> Why is it not working? Do i need to do any special kernel, modprobe
> things?

No, the above rule, combined with a (gulp) default ACCEPT policy on FORWARD, 
should do what you want.

I suggest the following:

1. Post the remainder of your ruleset so we can see what else may be having an 
effect.

2. Tell us how you are testing the rule.

3. Look at the output of "iptables -L -t nat -nvx" - do the packet & byte 
counters show that any packets are matching the above rule?

4. Put a LOGging rule in your FORWARD chain so you can see what packets appear 
to be going through the firewall (I suggest two rules, one for packets to TCP 
port 22, one for packets from TCP port 22, or alternatively two rules for 
packets to / from 192.168.100.6, so that you don't get so much logging output 
that you can't see what's going on).

5. Tell us about anything else which *does* work through your firewall (eg: 
can you browse the Internet from an internal client? can you send & receive 
email? can you resolve hostnames?)

Hope something here helps,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


