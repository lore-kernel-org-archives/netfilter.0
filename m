From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Bypass transparent proxy(Squid)
Date: Wed, 31 Mar 2004 20:22:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403312022.42527.Antony@Soft-Solutions.co.uk>
References: <040EAEDD7A465C4AA0350CB69A326D550C392D@backup2.GODO-2000>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <040EAEDD7A465C4AA0350CB69A326D550C392D@backup2.GODO-2000>
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

On Wednesday 31 March 2004 7:29 pm, Jerry Robles de Medina wrote:

> Dear all,
> I have read somewhere along the posts that it is possible to let 2 pc's
> (ip's) bypass a transparent proxy server(squid cache). I have tried it in
> the rc.firewall.up file but I cannot get it working. Can someone please
> shed some light into my problem?I know it has to do with iptables but dunno
> where and how.

The trick is to create a user-defined chain, match the addresses you want as 
exceptions, then do the NAT at the end of the chain (after the exceptions 
have been returned to the main chain).

Something like:

iptables -N mychain
iptables -A PREROUTING -t nat -p tcp --dport 80 -j mychain
iptables -A mychain -t nat -s a.b.c.d -j RETURN
iptables -A mychain -t nat -s w.x.y.z -j RETURN
iptables -A mychain -t nat -j DNAT --to my.squid.proxy.server:3128

The way this works is:
1. Only packets addressed to port 80 get processed by the user defined chain
2. The first exception source address a.b.c.d immediately returns (unchanged) 
the to main PREROUTING chain.
3. The second exception address w.x.y.z returns to the main PREROUTING chain.
4. Any other addresses get redirected.

I'm sure you can adjust this to your own requirements now you see the trick 
involved.   The important point is to recognise that the negation operator ! 
cannot deal with more than one exception address, so there's no point trying 
to force it to work.

Regards,

Antony.

-- 
The words "e pluribus unum" on the Great Seal of the United States are from a 
poem by Virgil entitled "Moretum", which is about cheese and garlic salad 
dressing.

                                                     Please reply to the list;
                                                           please don't CC me.


