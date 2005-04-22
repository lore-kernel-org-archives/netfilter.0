From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: ddos / no connection tracking / tarpitting
Date: Fri, 22 Apr 2005 17:28:55 -0500
Message-ID: <42697AA7.7030802@riverviewtech.net>
References: <BAY104-F417A02D74275560AA714548B2D0@phx.gbl>	<42688A26.9000705@riverviewtech.net>
	<Pine.LNX.4.60.0504221707050.15167@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0504221707050.15167@darkstar.sysinfo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: Vic N <vic778@hotmail.com>, netfilter@lists.netfilter.org

> the only way to really survive a ddos without affecting connectivity in 
> any shapoe or form is to have a bigger pipe then the other end<s> does. 
> idiots trying to ddos from a cable connection or dialup are not a 
> problem and sufferable.  Those a tad higher in technical advancement 
> with a bot net and tousands of zomies to attack from are likely to bring 
> even the biggest pipes to a dead halt, at least getting in and our of 
> the firewall gateway is impossible.  Traffic on the inside should be 
> unaffected.

One thing that I (personally) am trying to do (sort of) along these lines is to host a co-lo box at my ISP's facility and establish a GRE tunnel between my home system and this box and ultimately use an endpoint on this CO-LOed box as my default gateway.  This way I can set up QoS and specify what traffic is important to me and what has priority on what comes down my DSL pipe in a round about way.  Fortunetly I have an EXCELLENT working relationship, both professionally and personally, with my ISP and they would be willing to do such as well as drop any traffic that is destined to my DSL connection that did not come from the CO-LOed box.  This round about way would give me sufficient control over what traffic did flow down the DSL pipe to my house and thus mitigate DDoSing my DSL.  However seeing as my ISP only has 16 Mbps connection to the net it would not take much to DDoS them if it r
 eally came down to it.  But my DSL would not be DDoSed, just my ISP's upstream connection
.  I know that this is not a real elegant solution, but I never did say that it was, just something that might work.  ;)



Grant. . . .

